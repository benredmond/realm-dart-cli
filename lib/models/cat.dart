import 'package:realm_dart/realm.dart';
part 'cat.realm.dart';

@RealmModel()
class _Cat {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String name;
  late int? age;
  late int numWhiskers;
}
