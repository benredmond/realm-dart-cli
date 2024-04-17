// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asymmetric_cat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class AsymmetricCat extends _AsymmetricCat
    with RealmEntity, RealmObjectBase, AsymmetricObject {
  AsymmetricCat(
    ObjectId id,
    String name, {
    int? age,
    int? numWhiskers,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'age', age);
    RealmObjectBase.set(this, 'numWhiskers', numWhiskers);
  }

  AsymmetricCat._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get age => RealmObjectBase.get<int>(this, 'age') as int?;
  @override
  set age(int? value) => RealmObjectBase.set(this, 'age', value);

  @override
  int? get numWhiskers => RealmObjectBase.get<int>(this, 'numWhiskers') as int?;
  @override
  set numWhiskers(int? value) =>
      RealmObjectBase.set(this, 'numWhiskers', value);

  @override
  Stream<RealmObjectChanges<AsymmetricCat>> get changes =>
      RealmObjectBase.getChanges<AsymmetricCat>(this);

  @override
  AsymmetricCat freeze() => RealmObjectBase.freezeObject<AsymmetricCat>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'age': age.toEJson(),
      'numWhiskers': numWhiskers.toEJson(),
    };
  }

  static EJsonValue _toEJson(AsymmetricCat value) => value.toEJson();
  static AsymmetricCat _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'age': EJsonValue age,
        'numWhiskers': EJsonValue numWhiskers,
      } =>
        AsymmetricCat(
          fromEJson(id),
          fromEJson(name),
          age: fromEJson(age),
          numWhiskers: fromEJson(numWhiskers),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(AsymmetricCat._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.asymmetricObject, AsymmetricCat, 'AsymmetricCat', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('age', RealmPropertyType.int, optional: true),
      SchemaProperty('numWhiskers', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
