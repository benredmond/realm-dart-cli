// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Dog extends _Dog with RealmEntity, RealmObjectBase, RealmObject {
  Dog(
    ObjectId id,
    String name, {
    String? breed,
    int? age,
    String? color,
    String? country,
    Iterable<Toy> toys = const [],
    Map<String, Location?> locations = const {},
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'breed', breed);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'age', age);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set<RealmList<Toy>>(this, 'toys', RealmList<Toy>(toys));
    RealmObjectBase.set<RealmMap<Location?>>(
        this, 'locations', RealmMap<Location?>(locations));
  }

  Dog._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get breed => RealmObjectBase.get<String>(this, 'breed') as String?;
  @override
  set breed(String? value) => RealmObjectBase.set(this, 'breed', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get age => RealmObjectBase.get<int>(this, 'age') as int?;
  @override
  set age(int? value) => RealmObjectBase.set(this, 'age', value);

  @override
  String? get color => RealmObjectBase.get<String>(this, 'color') as String?;
  @override
  set color(String? value) => RealmObjectBase.set(this, 'color', value);

  @override
  String? get country =>
      RealmObjectBase.get<String>(this, 'country') as String?;
  @override
  set country(String? value) => RealmObjectBase.set(this, 'country', value);

  @override
  RealmList<Toy> get toys =>
      RealmObjectBase.get<Toy>(this, 'toys') as RealmList<Toy>;
  @override
  set toys(covariant RealmList<Toy> value) => throw RealmUnsupportedSetError();

  @override
  RealmMap<Location?> get locations =>
      RealmObjectBase.get<Location?>(this, 'locations') as RealmMap<Location?>;
  @override
  set locations(covariant RealmMap<Location?> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Dog>> get changes =>
      RealmObjectBase.getChanges<Dog>(this);

  @override
  Dog freeze() => RealmObjectBase.freezeObject<Dog>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'breed': breed.toEJson(),
      'name': name.toEJson(),
      'age': age.toEJson(),
      'color': color.toEJson(),
      'country': country.toEJson(),
      'toys': toys.toEJson(),
      'locations': locations.toEJson(),
    };
  }

  static EJsonValue _toEJson(Dog value) => value.toEJson();
  static Dog _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'breed': EJsonValue breed,
        'name': EJsonValue name,
        'age': EJsonValue age,
        'color': EJsonValue color,
        'country': EJsonValue country,
        'toys': EJsonValue toys,
        'locations': EJsonValue locations,
      } =>
        Dog(
          fromEJson(id),
          fromEJson(name),
          breed: fromEJson(breed),
          age: fromEJson(age),
          color: fromEJson(color),
          country: fromEJson(country),
          toys: fromEJson(toys),
          locations: fromEJson(locations),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Dog._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Dog, 'Dog', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('breed', RealmPropertyType.string, optional: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('age', RealmPropertyType.int, optional: true),
      SchemaProperty('color', RealmPropertyType.string, optional: true),
      SchemaProperty('country', RealmPropertyType.string, optional: true),
      SchemaProperty('toys', RealmPropertyType.object,
          linkTarget: 'Toy', collectionType: RealmCollectionType.list),
      SchemaProperty('locations', RealmPropertyType.object,
          optional: true,
          linkTarget: 'Location',
          collectionType: RealmCollectionType.map),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Location extends _Location
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Location({
    String type = 'Point',
    Iterable<double> coordinates = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Location>({
        'type': 'Point',
      });
    }
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set<RealmList<double>>(
        this, 'coordinates', RealmList<double>(coordinates));
  }

  Location._();

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  RealmList<double> get coordinates =>
      RealmObjectBase.get<double>(this, 'coordinates') as RealmList<double>;
  @override
  set coordinates(covariant RealmList<double> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Location>> get changes =>
      RealmObjectBase.getChanges<Location>(this);

  @override
  Location freeze() => RealmObjectBase.freezeObject<Location>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'type': type.toEJson(),
      'coordinates': coordinates.toEJson(),
    };
  }

  static EJsonValue _toEJson(Location value) => value.toEJson();
  static Location _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'type': EJsonValue type,
        'coordinates': EJsonValue coordinates,
      } =>
        Location(
          type: fromEJson(type),
          coordinates: fromEJson(coordinates),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Location._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, Location, 'Location', [
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('coordinates', RealmPropertyType.double,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Toy extends _Toy with RealmEntity, RealmObjectBase, EmbeddedObject {
  Toy(
    String name, {
    Brand? brand,
  }) {
    RealmObjectBase.set(this, 'brand', brand);
    RealmObjectBase.set(this, 'name', name);
  }

  Toy._();

  @override
  Brand? get brand => RealmObjectBase.get<Brand>(this, 'brand') as Brand?;
  @override
  set brand(covariant Brand? value) =>
      RealmObjectBase.set(this, 'brand', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Toy>> get changes =>
      RealmObjectBase.getChanges<Toy>(this);

  @override
  Toy freeze() => RealmObjectBase.freezeObject<Toy>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'brand': brand.toEJson(),
      'name': name.toEJson(),
    };
  }

  static EJsonValue _toEJson(Toy value) => value.toEJson();
  static Toy _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'brand': EJsonValue brand,
        'name': EJsonValue name,
      } =>
        Toy(
          fromEJson(name),
          brand: fromEJson(brand),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Toy._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, Toy, 'Toy', [
      SchemaProperty('brand', RealmPropertyType.object,
          optional: true, linkTarget: 'Brand'),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Brand extends _Brand with RealmEntity, RealmObjectBase, EmbeddedObject {
  Brand(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  Brand._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Brand>> get changes =>
      RealmObjectBase.getChanges<Brand>(this);

  @override
  Brand freeze() => RealmObjectBase.freezeObject<Brand>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
    };
  }

  static EJsonValue _toEJson(Brand value) => value.toEJson();
  static Brand _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'name': EJsonValue name,
      } =>
        Brand(
          fromEJson(name),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Brand._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, Brand, 'Brand', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
