// Copyright (c) 2017, Frank. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:corona/corona.dart';
import 'package:test/test.dart';
import 'dart:typed_data';

import 'package:corona/src/codec/convert.dart';

import '../objects/declaration_objects.dart';

void main() {
  group('bool', () {
    test('all values', () {
      expect(readBool(writeBool(null)), null);
      expect(readBool(writeBool(true)), true);
      expect(readBool(writeBool(false)), false);
    });

    test('should throw when decoding is impossible', () {
      try {
        expect(readBool(new Uint8List.fromList(const <int>[3])), isNull);
      } catch (e) {
        expect(e, isException);
      }
    });
  });

  group('int', () {
    const int zero = 0;
    const int short = 0x80;
    const int long = 123456789123456789123456789123456789;
    const int shortNeg = -0x80;
    const int longNeg = -123456789123456789123456789123456789;

    test('zero value', () {
      expect(readInt(writeInt(null)), null);
      expect(readInt(writeInt(zero)), zero);
    });

    test('all bit ranges', () {
      expect(readInt(writeInt(short)), short);
      expect(readInt(writeInt(long)), long);
      expect(readInt(writeInt(shortNeg)), shortNeg);
      expect(readInt(writeInt(longNeg)), longNeg);
    });
  });

  group('uint', () {
    const int zero = 0;
    const int short = 0x80;
    const int long = 123456789123456789123456789123456789;

    test('zero value', () {
      expect(readUint(writeUint(zero)), zero);
    });

    test('all bit ranges', () {
      expect(readUint(writeUint(short)), short);
      expect(readUint(writeUint(long)), long);
    });
  });

  group('String', () {
    const String zero = '';
    const String strA = 'hello!';
    const String strB = 'hello\r\n\tthere!';
    const String strC = '漢字';

    test('zero value', () {
      expect(readString(writeString(null)), null);
      expect(readString(writeString(zero)), zero);
    });

    test('all bit ranges', () {
      expect(readString(writeString(strA)), strA);
      expect(readString(writeString(strB)), strB);
      expect(readString(writeString(strC)), strC);
    });
  });

  group('DateTime', () {
    DateTime dateTime = new DateTime(2017, 8, 9, 11, 31, 20, 541, 0);

    test('zero value', () {
      expect(readDateTime(writeDateTime(null)), null);
    });

    test('random date time', () {
      expect(readDateTime(writeDateTime(dateTime)), dateTime);
    });
  });

  group('Iterable', () {
    const Iterable<int> zeroList = const [];
    const Iterable<int> intList = const <int>[1, 2, 3, 4, 5];
    const Iterable<String> strList = const <String>[
      'Hi',
      'from',
      'some',
      'list',
      'values',
      '漢字'
    ];

    test('zero value', () {
      expect(readIterable(writeIterable(null, writeInt), readInt), null);
      expect(
          readIterable(writeIterable(zeroList, writeInt), readInt), zeroList);
    });

    test('types', () {
      expect(readIterable(writeIterable(intList, writeInt), readInt), intList);
      expect(readIterable(writeIterable(strList, writeString), readString),
          strList);
    });
  });

  group('Complex data', () {
    Employee<Person> employee;

    setUp(() {
      // Create a new immutable [Employee]
      employee = EmployeeFactory.create(
          name: 'Alan Smith',
          supervisor: PersonFactory.create(
              name: 'Robert Walker',
              address: AddressFactory.create(
                  street: 'Regent Street',
                  number: 3,
                  country: CountryFactory.create(
                      name: 'Holland', codes: const <String>['HOL', 'NETH']))));
    });

    test('should be able to update deep values', () {
      Employee<Person> rebuiltEmployee = readEmployee(writeEmployee(employee));

      expect(rebuiltEmployee.name, 'Alan Smith');
      expect(rebuiltEmployee.address, isNull);
      expect(rebuiltEmployee.id, isNull);
      expect(rebuiltEmployee.supervisor.name, 'Robert Walker');
      expect(rebuiltEmployee.supervisor.address.street, 'Regent Street');
      expect(rebuiltEmployee.supervisor.address.number, 3);
      expect(rebuiltEmployee.supervisor.address.country.name, 'Holland');
      expect(rebuiltEmployee.supervisor.address.country.codes.first, 'HOL');
      expect(rebuiltEmployee.supervisor.address.country.codes.last, 'NETH');
    });
  });
}
