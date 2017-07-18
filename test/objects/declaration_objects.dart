library declaration_object;

import 'package:corona/corona.dart';

part 'declaration_objects.g.dart';

abstract class Country {
  String get name;
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