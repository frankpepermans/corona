// GENERATED CODE - DO NOT MODIFY BY HAND

part of declaration_object;

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Country
// **************************************************************************

@immutable
class _CountryImpl implements Country {
  @override
  final String name;
  @override
  final List<String> codes;
  const _CountryImpl({this.name, this.codes});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'name':
        return name;
      case 'codes':
        return codes;
    }
    return null;
  }

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is Country && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(0, this.name.hashCode), hash_combineAll(this.codes)));
  @override
  Map<String, dynamic> toJSON() => const CountryEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
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
        name: property == 'name' ? value as String : source.name,
        codes: property == 'codes' ? value as List<String> : source.codes);

class CountryFactory {
  static Country create({String name, List<String> codes}) =>
      new _CountryImpl(name: name, codes: codes);
}

Uint8List writeCountry(Country value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.name));
  write(data, writeIterable(value.codes, writeString));
  return new Uint8List.fromList(data);
}

Country readCountry(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String name = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final List<String> codes = readIterable(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)),
      readString);
  index += size + 1;
  return new _CountryImpl(name: name, codes: codes);
}

class CountryCodec extends Codec<Country, Map<String, dynamic>> {
  const CountryCodec();
  @override
  Converter<Country, Map<String, dynamic>> get encoder =>
      const CountryEncoder();
  @override
  Converter<Map<String, dynamic>, Country> get decoder =>
      const CountryDecoder();
}

class CountryEncoder extends Converter<Country, Map<String, dynamic>> {
  const CountryEncoder();
  @override
  Map<String, dynamic> convert(Country data) => <String, dynamic>{
        'name': data?.name,
        'codes': data?.codes,
      };
}

class CountryDecoder extends Converter<Map<String, dynamic>, Country> {
  const CountryDecoder();
  @override
  Country convert(Map<String, dynamic> data) => CountryFactory.create(
        name: data['name'] as String,
        codes: data['codes'] as List<String>,
      );
}

class _Country$<T> extends ObjectSchema<T> {
  const _Country$(List<String> path$) : super(path$);
  ObjectSchema<String> get name => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('name'))
      : const <String>['name']);
  ObjectSchema<List<String>> get codes =>
      new ObjectSchema<List<String>>(path$ != null
          ? (new List<String>.from(path$)..add('codes'))
          : const <String>['codes']);
}

Country countryLens<S>(Country entity,
    ObjectSchema<S> path(_Country$<Country> schema), S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Country$<Country>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_countryTearOff];
  S newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    TearOffAndValueObjectSchema currValue =
        values.last as TearOffAndValueObjectSchema;

    if (i < len - 1) {
      tearOffs.add(currValue.getTearOffForKey(key));
      values.add(currValue.getValueFromKey(key));
    } else {
      newValue = swapper(currValue.getValueFromKey(key) as S);
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue) as S;
  }

  return newValue as Country;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Address
// **************************************************************************

@immutable
class _AddressImpl implements Address {
  @override
  final String street;
  @override
  final int number;
  @override
  final String postalCode;
  @override
  final Country country;
  const _AddressImpl({this.street, this.number, this.postalCode, this.country});
  @override
  dynamic getValueFromKey(String key) {
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

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is Address && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(
          hash_combine(
              hash_combine(0, this.street.hashCode), this.number.hashCode),
          this.postalCode.hashCode),
      this.country.hashCode));
  @override
  Map<String, dynamic> toJSON() => const AddressEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'street':
        return null;
      case 'number':
        return null;
      case 'postalCode':
        return null;
      case 'country':
        return _countryTearOff as Function(dynamic, String, dynamic);
    }
    return null;
  }
}

_AddressImpl _addressTearOff(Address source, String property, dynamic value) =>
    new _AddressImpl(
        street: property == 'street' ? value as String : source.street,
        number: property == 'number' ? value as int : source.number,
        postalCode:
            property == 'postalCode' ? value as String : source.postalCode,
        country: property == 'country' ? value as Country : source.country);

class AddressFactory {
  static Address create(
          {String street, int number, String postalCode, Country country}) =>
      new _AddressImpl(
          street: street,
          number: number,
          postalCode: postalCode,
          country: country);
}

Uint8List writeAddress(Address value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.street));
  write(data, writeInt(value.number));
  write(data, writeString(value.postalCode));
  write(data, writeCountry(value.country));
  return new Uint8List.fromList(data);
}

Address readAddress(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String street = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final int number = readInt(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final String postalCode = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final Country country = readCountry(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _AddressImpl(
      street: street, number: number, postalCode: postalCode, country: country);
}

class AddressCodec extends Codec<Address, Map<String, dynamic>> {
  const AddressCodec();
  @override
  Converter<Address, Map<String, dynamic>> get encoder =>
      const AddressEncoder();
  @override
  Converter<Map<String, dynamic>, Address> get decoder =>
      const AddressDecoder();
}

class AddressEncoder extends Converter<Address, Map<String, dynamic>> {
  const AddressEncoder();
  @override
  Map<String, dynamic> convert(Address data) => <String, dynamic>{
        'street': data?.street,
        'number': data?.number,
        'postalCode': data?.postalCode,
        'country': data == null || data.country == null
            ? null
            : const CountryEncoder().convert(data.country),
      };
}

class AddressDecoder extends Converter<Map<String, dynamic>, Address> {
  const AddressDecoder();
  @override
  Address convert(Map<String, dynamic> data) => AddressFactory.create(
        street: data['street'] as String,
        number: data['number'] as int,
        postalCode: data['postalCode'] as String,
        country: data == null || data['country'] == null
            ? null
            : const CountryDecoder()
                .convert(data['country'] as Map<String, dynamic>),
      );
}

class _Address$<T> extends ObjectSchema<T> {
  const _Address$(List<String> path$) : super(path$);
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

Address addressLens<S>(Address entity,
    ObjectSchema<S> path(_Address$<Address> schema), S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Address$<Address>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_addressTearOff];
  S newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    TearOffAndValueObjectSchema currValue =
        values.last as TearOffAndValueObjectSchema;

    if (i < len - 1) {
      tearOffs.add(currValue.getTearOffForKey(key));
      values.add(currValue.getValueFromKey(key));
    } else {
      newValue = swapper(currValue.getValueFromKey(key) as S);
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue) as S;
  }

  return newValue as Address;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Person
// **************************************************************************

@immutable
class _PersonImpl implements Person {
  @override
  final String name;
  @override
  final Address address;
  const _PersonImpl({this.name, this.address});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'name':
        return name;
      case 'address':
        return address;
    }
    return null;
  }

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is Person && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(
      hash_combine(hash_combine(0, this.name.hashCode), this.address.hashCode));
  @override
  Map<String, dynamic> toJSON() => const PersonEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'name':
        return null;
      case 'address':
        return _addressTearOff as Function(dynamic, String, dynamic);
    }
    return null;
  }
}

_PersonImpl _personTearOff(Person source, String property, dynamic value) =>
    new _PersonImpl(
        name: property == 'name' ? value as String : source.name,
        address: property == 'address' ? value as Address : source.address);

class PersonFactory {
  static Person create({String name, Address address}) =>
      new _PersonImpl(name: name, address: address);
}

Uint8List writePerson(Person value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.name));
  write(data, writeAddress(value.address));
  return new Uint8List.fromList(data);
}

Person readPerson(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String name = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final Address address = readAddress(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _PersonImpl(name: name, address: address);
}

class PersonCodec extends Codec<Person, Map<String, dynamic>> {
  const PersonCodec();
  @override
  Converter<Person, Map<String, dynamic>> get encoder => const PersonEncoder();
  @override
  Converter<Map<String, dynamic>, Person> get decoder => const PersonDecoder();
}

class PersonEncoder extends Converter<Person, Map<String, dynamic>> {
  const PersonEncoder();
  @override
  Map<String, dynamic> convert(Person data) => <String, dynamic>{
        'name': data?.name,
        'address': data == null || data.address == null
            ? null
            : const AddressEncoder().convert(data.address),
      };
}

class PersonDecoder extends Converter<Map<String, dynamic>, Person> {
  const PersonDecoder();
  @override
  Person convert(Map<String, dynamic> data) => PersonFactory.create(
        name: data['name'] as String,
        address: data == null || data['address'] == null
            ? null
            : const AddressDecoder()
                .convert(data['address'] as Map<String, dynamic>),
      );
}

class _Person$<T> extends ObjectSchema<T> {
  const _Person$(List<String> path$) : super(path$);
  ObjectSchema<String> get name => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('name'))
      : const <String>['name']);
  _Address$<Address> get address => new _Address$<Address>(path$ != null
      ? (new List<String>.from(path$)..add('address'))
      : const <String>['address']);
}

Person personLens<S>(Person entity,
    ObjectSchema<S> path(_Person$<Person> schema), S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Person$<Person>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_personTearOff];
  S newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    TearOffAndValueObjectSchema currValue =
        values.last as TearOffAndValueObjectSchema;

    if (i < len - 1) {
      tearOffs.add(currValue.getTearOffForKey(key));
      values.add(currValue.getValueFromKey(key));
    } else {
      newValue = swapper(currValue.getValueFromKey(key) as S);
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue) as S;
  }

  return newValue as Person;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Employee
// **************************************************************************

@immutable
class _EmployeeImpl<T extends Person> extends Object
    implements Employee<T>, Person {
  @override
  final String id;
  @override
  final Person supervisor;
  @override
  final String name;
  @override
  final Address address;
  const _EmployeeImpl({this.id, this.supervisor, this.name, this.address});
  @override
  dynamic getValueFromKey(String key) {
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

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is Employee && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(
          hash_combine(
              hash_combine(0, this.id.hashCode), this.supervisor.hashCode),
          this.name.hashCode),
      this.address.hashCode));
  @override
  Map<String, dynamic> toJSON() => const EmployeeEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'id':
        return null;
      case 'supervisor':
        return _personTearOff as Function(dynamic, String, dynamic);
      case 'name':
        return null;
      case 'address':
        return _addressTearOff as Function(dynamic, String, dynamic);
    }
    return null;
  }
}

_EmployeeImpl<T> _employeeTearOff<T extends Person>(
        Employee<T> source, String property, dynamic value) =>
    new _EmployeeImpl<T>(
        id: property == 'id' ? value as String : source.id,
        supervisor:
            property == 'supervisor' ? value as Person : source.supervisor,
        name: property == 'name' ? value as String : source.name,
        address: property == 'address' ? value as Address : source.address);

class EmployeeFactory {
  static Employee<T> create<T extends Person>(
          {String id, Person supervisor, String name, Address address}) =>
      new _EmployeeImpl<T>(
          id: id, supervisor: supervisor, name: name, address: address);
}

Uint8List writeEmployee(Employee value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.id));
  write(data, writePerson(value.supervisor));
  write(data, writeString(value.name));
  write(data, writeAddress(value.address));
  return new Uint8List.fromList(data);
}

Employee readEmployee(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String id = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final Person supervisor = readPerson(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final String name = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final Address address = readAddress(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _EmployeeImpl(
      id: id, supervisor: supervisor, name: name, address: address);
}

class EmployeeCodec extends Codec<Employee, Map<String, dynamic>> {
  const EmployeeCodec();
  @override
  Converter<Employee, Map<String, dynamic>> get encoder =>
      const EmployeeEncoder();
  @override
  Converter<Map<String, dynamic>, Employee> get decoder =>
      const EmployeeDecoder();
}

class EmployeeEncoder extends Converter<Employee, Map<String, dynamic>> {
  const EmployeeEncoder();
  @override
  Map<String, dynamic> convert(Employee data) => <String, dynamic>{
        'id': data?.id,
        'supervisor': data == null || data.supervisor == null
            ? null
            : const PersonEncoder().convert(data.supervisor),
        'name': data?.name,
        'address': data == null || data.address == null
            ? null
            : const AddressEncoder().convert(data.address),
      };
}

class EmployeeDecoder extends Converter<Map<String, dynamic>, Employee> {
  const EmployeeDecoder();
  @override
  Employee convert(Map<String, dynamic> data) => EmployeeFactory.create(
        id: data['id'] as String,
        supervisor: data == null || data['supervisor'] == null
            ? null
            : const PersonDecoder()
                .convert(data['supervisor'] as Map<String, dynamic>),
        name: data['name'] as String,
        address: data == null || data['address'] == null
            ? null
            : const AddressDecoder()
                .convert(data['address'] as Map<String, dynamic>),
      );
}

class _Employee$<T> extends ObjectSchema<T> {
  const _Employee$(List<String> path$) : super(path$);
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

Employee employeeLens<S>(Employee entity,
    ObjectSchema<S> path(_Employee$<Employee> schema), S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Employee$<Employee>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_employeeTearOff];
  S newValue;

  for (int i = 0, len = schema.path$.length; i < len; i++) {
    String key = schema.path$[i];
    TearOffAndValueObjectSchema currValue =
        values.last as TearOffAndValueObjectSchema;

    if (i < len - 1) {
      tearOffs.add(currValue.getTearOffForKey(key));
      values.add(currValue.getValueFromKey(key));
    } else {
      newValue = swapper(currValue.getValueFromKey(key) as S);
    }
  }

  for (int i = tearOffs.length - 1; i >= 0; i--) {
    newValue = tearOffs[i](values[i], schema.path$[i], newValue) as S;
  }

  return newValue as Employee;
}
