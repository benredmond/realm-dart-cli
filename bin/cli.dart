import 'dart:io';

import 'package:cli/models/cat.dart';
import 'package:cli/models/dog.dart';
import 'package:cli/models/asymmetric_cat.dart';
import 'package:realm_dart/realm.dart';
import 'package:cli/utils.dart';

final appId = '<APP-ID>';

// final baseURL = new Uri.http("localhost:8080");
final baseURL = Uri(scheme: "https", host: 'services.cloud-stage.mongodb.com');

final numObjectsToCreate = 1;
final listenToChanges = true;

final schemaVersion = 0;

final catQuery = "numWhiskers < 10"; // This is the query for the Cats table
final dogQuery = "age < 50"; // This is the query for the Dogs table

void main(List<String> arguments) async {
  final appConfig = AppConfiguration(appId, baseUrl: baseURL);
  final app = App(appConfig);
  final user = await app.logIn(Credentials.anonymous());
  final flxConfig = Configuration.flexibleSync(user,
    [Cat.schema, Dog.schema, AsymmetricCat.schema, Toy.schema, Location.schema, Brand.schema],
    schemaVersion: schemaVersion,
  );
  final realm = await Realm.open(flxConfig);

  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realm.query<Dog>(dogQuery));
  });

  await realm.subscriptions.waitForSynchronization();

  if (listenToChanges) {
    final cats = realm.all<Cat>();
    cats.changes.listen((changes) {
      handleChanges<Cat>(changes, getCatString, "cat");
    });

    final dogs = realm.all<Dog>();
    dogs.changes.listen((changes) {
      handleChanges<Dog>(changes, getDogString, "dog");
    });
  }

  var catQueryAdded = false;

  printOptions();

  while (true) {
    final sessActive = realm.syncSession.state == SessionState.active;

    print('Waiting for input: ');
    var input = stdin.readLineSync();
    print('');

    switch (input) {
      case 'h':
        printOptions();
        break;
      case '0':
        print("Fetching Realm updates...");
        break;
      case '1':
        printAllObjs<Dog>(realm, printDog);
        break;
      case '2':
        createSomeObjs<Dog>(realm, numObjectsToCreate, genDog);
        print("Created $numObjectsToCreate Dogs");
        break;
      case '3':
        deleteAllObjs<Dog>(realm);
        break;
      case '4':
        if (catQueryAdded) {
            print('Removing subscription for Cat');
            realm.subscriptions.update((mutableSubscriptions) =>
                mutableSubscriptions.removeByQuery(realm.all<Cat>())
            );
            print('Removed');
          } else {
            print('Adding subscription for Cat');
            realm.subscriptions.update((mutableSubscriptions) =>
              mutableSubscriptions.add(realm.query<Cat>(catQuery))
            );
            print('Added');
        }
        catQueryAdded = !catQueryAdded;
        await realm.subscriptions.waitForSynchronization();
        break;
      case '5':
        printAllObjs<Cat>(realm, printCat);
        break;
      case '6':
        createSomeObjs<Cat>(realm, numObjectsToCreate, genCat);
        print("Created $numObjectsToCreate Cats");
        break;
      case '7':
        deleteAllObjs<Cat>(realm);
        break;
      case '8':
        ingestSomeObjs<AsymmetricCat>(realm, numObjectsToCreate, genAsymmetricCat);
        print("Created $numObjectsToCreate Asymmetric Cats");
        break;
      case '9':
        if (sessActive) {
          realm.syncSession.pause();
          print("Session paused");
        } else {
          realm.syncSession.resume();
          print("Session resumed");
        }
        break;
      case '10':
        print("Bye!");
        realm.close();
        Realm.shutdown();
        exit(0);
      default:
        print('Invalid option. Please select a valid number.');
    }

    await realm.subscriptions.waitForSynchronization();
    print('');
  }
}

void printOptions() {
  print('\n*************************');
  print('Select a number:');
  print('(0) Fetch Realm Updates');
  print('(1) Read Dogs');
  print('(2) Write Dogs');
  print('(3) Delete All Dogs');
  print('(4) Add/Remove Subscription On Cats');
  print('(5) Read Cats');
  print('(6) Write Cats');
  print('(7) Delete All Cats');
  print('(8) Write Asymmetric Cat');
  print('(9) Pause/Resume Session');
  print('(10) Exit');
  print('(h) To see this menu again');
  print('*************************\n');
}