// GENERATED CODE - DO NOT MODIFY BY HAND

part of declaration_object;

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Country
// **************************************************************************

class _CountryImpl implements Country {
  final String name;
  final BuiltSet<String> codes;
  const _CountryImpl({this.name, this.codes});
  dynamic _getValueFromKey(String key) {
    switch (key) {
      case 'name':
        return name;
      case 'codes':
        return codes;
    }
    return null;
  }

  TearOff<dynamic> _getTearOffForKey(String key) {
    switch (key) {
      case 'name':
        return null;
      case 'codes':
        return null;
    }
    return null;
  }
}

_CountryImpl _countryTearOff(Country source, String property, dynamic value) =>
    new _CountryImpl(
        name: property == 'name' ? value : source.name,
        codes: property == 'codes' ? value : source.codes);

class CountryFactory {
  static Country create({String name, BuiltSet<String> codes}) =>
      new _CountryImpl(name: name, codes: codes);
}

class _Country$<T> extends ObjectSchema<T> {
  const _Country$(Iterable<String> path$) : super(path$);
  ObjectSchema<String> get name => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('name'))
      : const <String>['name']);
  ObjectSchema<BuiltSet<String>> get codes =>
      new ObjectSchema<BuiltSet<String>>(path$ != null
          ? (new List<String>.from(path$)..add('codes'))
          : const <String>['codes']);
}

Country countryLens<S, T extends S>(Country entity,
    ObjectSchema<S> path(_Country$<Country> schema), T swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Country$(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<TearOff<dynamic>> tearOffs = <TearOff<dynamic>>[_countryTearOff];
  dynamic newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    dynamic currValue = values.last;

    if (i < len - 1) {
      tearOffs.add(currValue._getTearOffForKey(key));
      values.add(currValue._getValueFromKey(key));
    } else {
      newValue = swapper(currValue._getValueFromKey(key));
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue);
  }

  return newValue;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Address
// **************************************************************************

class _AddressImpl implements Address {
  final String street;
  final int number;
  final String postalCode;
  final Country country;
  const _AddressImpl({this.street, this.number, this.postalCode, this.country});
  dynamic _getValueFromKey(String key) {
    switch (key) {
      case 'street':
        return street;
      case 'number':
        return number;
      case 'postalCode':
        return postalCode;
      case 'country':
        return country;
    }
    return null;
  }

  TearOff<dynamic> _getTearOffForKey(String key) {
    switch (key) {
      case 'street':
        return null;
      case 'number':
        return null;
      case 'postalCode':
        return null;
      case 'country':
        return _countryTearOff;
    }
    return null;
  }
}

_AddressImpl _addressTearOff(Address source, String property, dynamic value) =>
    new _AddressImpl(
        street: property == 'street' ? value : source.street,
        number: property == 'number' ? value : source.number,
        postalCode: property == 'postalCode' ? value : source.postalCode,
        country: property == 'country' ? value : source.country);

class AddressFactory {
  static Address create(
          {String street, int number, String postalCode, Country country}) =>
      new _AddressImpl(
          street: street,
          number: number,
          postalCode: postalCode,
          country: country);
}

class _Address$<T> extends ObjectSchema<T> {
  const _Address$(Iterable<String> path$) : super(path$);
  ObjectSchema<String> get street => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('street'))
      : const <String>['street']);
  ObjectSchema<int> get number => new ObjectSchema<int>(path$ != null
      ? (new List<String>.from(path$)..add('number'))
      : const <String>['number']);
  ObjectSchema<String> get postalCode => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('postalCode'))
      : const <String>['postalCode']);
  _Country$<Country> get country => new _Country$<Country>(path$ != null
      ? (new List<String>.from(path$)..add('country'))
      : const <String>['country']);
}

Address addressLens<S, T extends S>(Address entity,
    ObjectSchema<S> path(_Address$<Address> schema), T swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Address$(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<TearOff<dynamic>> tearOffs = <TearOff<dynamic>>[_addressTearOff];
  dynamic newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    dynamic currValue = values.last;

    if (i < len - 1) {
      tearOffs.add(currValue._getTearOffForKey(key));
      values.add(currValue._getValueFromKey(key));
    } else {
      newValue = swapper(currValue._getValueFromKey(key));
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue);
  }

  return newValue;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Person
// **************************************************************************

class _PersonImpl implements Person {
  final String name;
  final Address address;
  const _PersonImpl({this.name, this.address});
  dynamic _getValueFromKey(String key) {
    switch (key) {
      case 'name':
        return name;
      case 'address':
        return address;
    }
    return null;
  }

  TearOff<dynamic> _getTearOffForKey(String key) {
    switch (key) {
      case 'name':
        return null;
      case 'address':
        return _addressTearOff;
    }
    return null;
  }
}

_PersonImpl _personTearOff(Person source, String property, dynamic value) =>
    new _PersonImpl(
        name: property == 'name' ? value : source.name,
        address: property == 'address' ? value : source.address);

class PersonFactory {
  static Person create({String name, Address address}) =>
      new _PersonImpl(name: name, address: address);
}

class _Person$<T> extends ObjectSchema<T> {
  const _Person$(Iterable<String> path$) : super(path$);
  ObjectSchema<String> get name => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('name'))
      : const <String>['name']);
  _Address$<Address> get address => new _Address$<Address>(path$ != null
      ? (new List<String>.from(path$)..add('address'))
      : const <String>['address']);
}

Person personLens<S, T extends S>(Person entity,
    ObjectSchema<S> path(_Person$<Person> schema), T swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Person$(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<TearOff<dynamic>> tearOffs = <TearOff<dynamic>>[_personTearOff];
  dynamic newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    dynamic currValue = values.last;

    if (i < len - 1) {
      tearOffs.add(currValue._getTearOffForKey(key));
      values.add(currValue._getValueFromKey(key));
    } else {
      newValue = swapper(currValue._getValueFromKey(key));
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue);
  }

  return newValue;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Employee
// **************************************************************************

class _EmployeeImpl<T extends Person> extends Object
    implements Employee<T>, Person {
  final String id;
  final Person supervisor;
  final String name;
  final Address address;
  const _EmployeeImpl({this.id, this.supervisor, this.name, this.address});
  dynamic _getValueFromKey(String key) {
    switch (key) {
      case 'id':
        return id;
      case 'supervisor':
        return supervisor;
      case 'name':
        return name;
      case 'address':
        return address;
    }
    return null;
  }

  TearOff<dynamic> _getTearOffForKey(String key) {
    switch (key) {
      case 'id':
        return null;
      case 'supervisor':
        return _personTearOff;
      case 'name':
        return null;
      case 'address':
        return _addressTearOff;
    }
    return null;
  }
}

_EmployeeImpl<T> _employeeTearOff<T extends Person>(
        Employee<T> source, String property, dynamic value) =>
    new _EmployeeImpl<T>(
        id: property == 'id' ? value : source.id,
        supervisor: property == 'supervisor' ? value : source.supervisor,
        name: property == 'name' ? value : source.name,
        address: property == 'address' ? value : source.address);

class EmployeeFactory {
  static Employee<T> create<T extends Person>(
          {String id, Person supervisor, String name, Address address}) =>
      new _EmployeeImpl<T>(
          id: id, supervisor: supervisor, name: name, address: address);
}

class _Employee$<T> extends ObjectSchema<T> {
  const _Employee$(Iterable<String> path$) : super(path$);
  ObjectSchema<String> get id => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('id'))
      : const <String>['id']);
  _Person$<Person> get supervisor => new _Person$<Person>(path$ != null
      ? (new List<String>.from(path$)..add('supervisor'))
      : const <String>['supervisor']);
  ObjectSchema<String> get name => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('name'))
      : const <String>['name']);
  _Address$<Address> get address => new _Address$<Address>(path$ != null
      ? (new List<String>.from(path$)..add('address'))
      : const <String>['address']);
}

Employee employeeLens<S, T extends S>(Employee entity,
    ObjectSchema<S> path(_Employee$<Employee> schema), T swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Employee$(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<TearOff<dynamic>> tearOffs = <TearOff<dynamic>>[_employeeTearOff];
  dynamic newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    dynamic currValue = values.last;

    if (i < len - 1) {
      tearOffs.add(currValue._getTearOffForKey(key));
      values.add(currValue._getValueFromKey(key));
    } else {
      newValue = swapper(currValue._getValueFromKey(key));
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue);
  }

  return newValue;
}
