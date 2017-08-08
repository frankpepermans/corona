library declaration_object;

import 'package:corona/corona.dart';
import 'package:built_collection/built_collection.dart';

part 'declaration_objects.g.dart';

abstract class Country {
  String get name;
  BuiltSet<String> get codes;
}

abstract class Address {
  String get street;
  int get number;
  String get postalCode;
  Country get country;
}

abstract class Person {
  String get name;
  Address get address;
}

abstract class Employee<T extends Person> extends Person {
  String get id;
  Person get supervisor;
}