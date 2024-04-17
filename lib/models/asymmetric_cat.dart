import 'package:realm_dart/realm.dart';
part 'asymmetric_cat.realm.dart';

@RealmModel(ObjectType.asymmetricObject)
class _AsymmetricCat {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String name;
  late int? age;
  late int? numWhiskers;
}
