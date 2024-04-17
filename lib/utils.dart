import 'dart:async';

import 'package:realm_dart/realm.dart';
import 'package:cli/models/cat.dart';
import 'package:cli/models/dog.dart';
import 'package:cli/models/asymmetric_cat.dart';
import 'dart:math';

void printAllObjs<T extends RealmObject>(Realm realm, void Function(T) printObj) {
  var objects = realm.all<T>();
  for (var obj in objects) {
    printObj(obj);
  }
  print("\n${objects.length} total");
}

void createSomeObjs<T extends RealmObject>(Realm realm, int numObjects, T Function() genObj) {
  realm.write(() {
    for (int i= 0; i < numObjects; i++) {
      realm.add(genObj());
    }
  });
}

void ingestSomeObjs<T extends AsymmetricObject>(Realm realm, int numObjects, T Function() genObj) {
  realm.write(() {
    for (int i= 0; i < numObjects; i++) {
      realm.ingest(genObj());
    }
  });
}


void deleteAllObjs<T extends RealmObject>(Realm realm) {
  realm.write(() {
    var allObjects = realm.all<T>();
    realm.deleteMany(allObjects);
  });
}

void handleChanges<T extends RealmObject>(RealmResultsChanges<T> changes, String Function(T) getString, String tableName) {
  if (changes.deleted.isEmpty && changes.inserted.isEmpty && changes.newModified.isEmpty) {
    return;
  }


  print('\n*************************');
  print('Realm Changes\n');
  for (var _ in changes.deleted) {
      print('A $tableName was deleted');
    }

    for (var index in changes.inserted) {
      var insertedObj = changes.results[index];
      print('Inserted $tableName ${getString(insertedObj)}');
    }
    for (var index in changes.newModified) {
      var modifiedObj = changes.results[index];
      print('Modified $tableName ${getString(modifiedObj)}');
    }
  print('*************************');
}

String getDogString(Dog dog) {
  return '{name: ${dog.name}, age: ${dog.age}, breed: ${dog.age}, '
      'color: ${dog.color}, country: ${dog.country}, toy: ${getToysString(dog.toys)}, '
      'location: ${getLocationsString(dog.locations)}}';
}

String getLocationsString(RealmMap<Location?> locations) {
  return "";
  // var ret = "";
  // for (var location in locations) {
  //   final locStr = getLocationString(location);
  //   ret += '\t$locStr';
  // }
  // return ret;
}

String getLocationString(Location location) {
  return '{type: ${location.type}, lat: ${location.lat}, lon: ${location.lon}}';
}

String getToysString(RealmList<Toy?> locations) {
  return "";
  // var ret = "";
  // for (var location in locations) {
  //   final locStr = getLocationString(location);
  //   ret += '\t$locStr';
  // }
  // return ret;
}

String getToyString(Toy toy) {
  final brand = toy.brand != null ? ', ${getBrandString(toy.brand)}' : '';
  return '{name: ${toy.name}$brand}';
}

String getBrandString(Brand? brand) {
  if (brand == null){
    return '';
  }
  return '{name: ${brand.name}}';
}

String getCatString(Cat cat) {
  return cat.name;
}

void printDog(Dog dog) {
  print('Dog: ${getDogString(dog)}');
}

void printCat(Cat cat) {
  print('Cat: ${getCatString(cat)}');
}


Dog genDog() {
    final random = Random();

    final objID = ObjectId();
    return Dog(
      objID,
      'Doggo_$objID',
      age: random.nextInt(50),
      toys: [
        Toy('Toy${random.nextInt(10)}', brand: Brand("bar")),
        Toy('Toy${random.nextInt(10)}', brand: Brand("foo"))
      ],
      locations: {
        "foo": Location(coordinates: [random.nextDouble() * 360 - 180, random.nextDouble() * 180 - 90]),
        "bar": Location(coordinates: [random.nextDouble() * 360 - 180, random.nextDouble() * 180 - 90])
      },
    );
}

Cat genCat() {
    final random = Random();
    final objID = ObjectId();
    return Cat(
      objID,
      'Cat_$objID',
        random.nextInt(10),
      // age: random.nextInt(100),
      // numWhiskers:
    );
}

AsymmetricCat genAsymmetricCat() {
  final random = Random();
  final objID = ObjectId();
  return AsymmetricCat(
    objID,
    'AsymmetricCat_$objID',
    age: random.nextInt(100),
    numWhiskers: random.nextInt(10),
  );
}