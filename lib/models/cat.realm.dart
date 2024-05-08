// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Cat extends _Cat with RealmEntity, RealmObjectBase, RealmObject {
  Cat(
    ObjectId id,
    String name,
    int numWhiskers, {
    int? age,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'age', age);
    RealmObjectBase.set(this, 'numWhiskers', numWhiskers);
  }

  Cat._();

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
  int get numWhiskers => RealmObjectBase.get<int>(this, 'numWhiskers') as int;
  @override
  set numWhiskers(int value) => RealmObjectBase.set(this, 'numWhiskers', value);

  @override
  Stream<RealmObjectChanges<Cat>> get changes =>
      RealmObjectBase.getChanges<Cat>(this);

  @override
  Stream<RealmObjectChanges<Cat>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Cat>(this, keyPaths);

  @override
  Cat freeze() => RealmObjectBase.freezeObject<Cat>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'name': name.toEJson(),
      'age': age.toEJson(),
      'numWhiskers': numWhiskers.toEJson(),
    };
  }

  static EJsonValue _toEJson(Cat value) => value.toEJson();
  static Cat _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'name': EJsonValue name,
        'age': EJsonValue age,
        'numWhiskers': EJsonValue numWhiskers,
      } =>
        Cat(
          fromEJson(id),
          fromEJson(name),
          fromEJson(numWhiskers),
          age: fromEJson(age),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Cat._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Cat, 'Cat', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('age', RealmPropertyType.int, optional: true),
      SchemaProperty('numWhiskers', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
