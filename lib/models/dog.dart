import 'package:realm_dart/realm.dart';
part 'dog.realm.dart';

@RealmModel()
class _Dog {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String? breed;
  late String name;
  late int? age;
  late String? color;
  late String? country;
  late List<_Toy> toys;
  late Map<String, _Location?> locations;
}

@RealmModel(ObjectType.embeddedObject)
class _Location {
  late String type = 'Point';
  late List<double> coordinates = [];

  // The rest of the class is just convenience methods
  double get lon => coordinates[0];
  set lon(double value) => coordinates[0] = value;

  double get lat => coordinates[1];
  set lat(double value) => coordinates[1] = value;

  GeoPoint toGeoPoint() => GeoPoint(lon: lon, lat: lat);
}

@RealmModel(ObjectType.embeddedObject)
class _Toy {
  late _Brand? brand;
  late String name;
}

@RealmModel(ObjectType.embeddedObject)
class _Brand {
  late String name;
}