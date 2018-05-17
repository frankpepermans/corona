library table_entities;

import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:corona/corona.dart';

part 'table_entities.g.dart';

abstract class Table implements TearOffAndValueObjectSchema {
  bool get isNew;
  bool get isRowsDynamic;
  bool get isColsDynamic;
  bool get hasHeader;
  bool get hasFooter;
  int get numRows;
  int get numCols;
  List<TableRow> get rows;
  TableQuestion get dynamicRowsQuestion;
}

abstract class TableRow implements TearOffAndValueObjectSchema {
  int get rowIndex;
  List<TableColumn> get columns;
  bool get isDynamic;
}

abstract class TableColumn implements TearOffAndValueObjectSchema {
  int get colIndex;
  bool get isDynamic;
  bool get isHeader;
  bool get isFooter;
  String get value;
  TableVariable get variable;
}

abstract class TableQuestion implements TearOffAndValueObjectSchema {
  String get id;
  String get question;
}

abstract class TableVariable implements TearOffAndValueObjectSchema {
  String get id;
  String get label;
}
