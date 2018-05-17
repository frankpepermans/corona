// GENERATED CODE - DO NOT MODIFY BY HAND

part of table_entities;

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class Table
// **************************************************************************

@immutable
class _TableImpl implements Table, TearOffAndValueObjectSchema {
  @override
  final bool isNew;
  @override
  final bool isRowsDynamic;
  @override
  final bool isColsDynamic;
  @override
  final bool hasHeader;
  @override
  final bool hasFooter;
  @override
  final int numRows;
  @override
  final int numCols;
  @override
  final List<TableRow> rows;
  @override
  final TableQuestion dynamicRowsQuestion;
  const _TableImpl(
      {this.isNew,
      this.isRowsDynamic,
      this.isColsDynamic,
      this.hasHeader,
      this.hasFooter,
      this.numRows,
      this.numCols,
      this.rows,
      this.dynamicRowsQuestion});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'isNew':
        return isNew;
      case 'isRowsDynamic':
        return isRowsDynamic;
      case 'isColsDynamic':
        return isColsDynamic;
      case 'hasHeader':
        return hasHeader;
      case 'hasFooter':
        return hasFooter;
      case 'numRows':
        return numRows;
      case 'numCols':
        return numCols;
      case 'rows':
        return rows;
      case 'dynamicRowsQuestion':
        return dynamicRowsQuestion;
    }
    return null;
  }

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    this.rows?.forEach((TableRow item) => item.expand(list));
    if (dynamicRowsQuestion != null) {
      this.dynamicRowsQuestion.expand(list);
    }
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is Table && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(
          hash_combine(
              hash_combine(
                  hash_combine(
                      hash_combine(
                          hash_combine(
                              hash_combine(hash_combine(0, this.isNew.hashCode),
                                  this.isRowsDynamic.hashCode),
                              this.isColsDynamic.hashCode),
                          this.hasHeader.hashCode),
                      this.hasFooter.hashCode),
                  this.numRows.hashCode),
              this.numCols.hashCode),
          hash_combineAll(this.rows)),
      this.dynamicRowsQuestion.hashCode));
  @override
  Map<String, dynamic> toJSON() => const TableEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'isNew':
        return null;
      case 'isRowsDynamic':
        return null;
      case 'isColsDynamic':
        return null;
      case 'hasHeader':
        return null;
      case 'hasFooter':
        return null;
      case 'numRows':
        return null;
      case 'numCols':
        return null;
      case 'rows':
        return null;
      case 'dynamicRowsQuestion':
        return _tableQuestionTearOff as Function(dynamic, String, dynamic);
    }
    return null;
  }
}

_TableImpl _tableTearOff(Table source, String property, dynamic value) =>
    new _TableImpl(
        isNew: property == 'isNew' ? value as bool : source.isNew,
        isRowsDynamic:
            property == 'isRowsDynamic' ? value as bool : source.isRowsDynamic,
        isColsDynamic:
            property == 'isColsDynamic' ? value as bool : source.isColsDynamic,
        hasHeader: property == 'hasHeader' ? value as bool : source.hasHeader,
        hasFooter: property == 'hasFooter' ? value as bool : source.hasFooter,
        numRows: property == 'numRows' ? value as int : source.numRows,
        numCols: property == 'numCols' ? value as int : source.numCols,
        rows: property == 'rows' ? value as List<TableRow> : source.rows,
        dynamicRowsQuestion: property == 'dynamicRowsQuestion'
            ? value as TableQuestion
            : source.dynamicRowsQuestion);

class TableFactory {
  static Table create(
          {bool isNew,
          bool isRowsDynamic,
          bool isColsDynamic,
          bool hasHeader,
          bool hasFooter,
          int numRows,
          int numCols,
          List<TableRow> rows,
          TableQuestion dynamicRowsQuestion}) =>
      new _TableImpl(
          isNew: isNew,
          isRowsDynamic: isRowsDynamic,
          isColsDynamic: isColsDynamic,
          hasHeader: hasHeader,
          hasFooter: hasFooter,
          numRows: numRows,
          numCols: numCols,
          rows: rows,
          dynamicRowsQuestion: dynamicRowsQuestion);
}

Uint8List writeTable(Table value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeBool(value.isNew));
  write(data, writeBool(value.isRowsDynamic));
  write(data, writeBool(value.isColsDynamic));
  write(data, writeBool(value.hasHeader));
  write(data, writeBool(value.hasFooter));
  write(data, writeInt(value.numRows));
  write(data, writeInt(value.numCols));
  write(data, writeIterable(value.rows, writeTableRow));
  write(data, writeTableQuestion(value.dynamicRowsQuestion));
  return new Uint8List.fromList(data);
}

Table readTable(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final bool isNew = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool isRowsDynamic = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool isColsDynamic = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool hasHeader = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool hasFooter = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final int numRows = readInt(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final int numCols = readInt(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final List<TableRow> rows = readIterable(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)),
      readTableRow);
  index += size + 1;
  size = data[index];
  final TableQuestion dynamicRowsQuestion = readTableQuestion(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _TableImpl(
      isNew: isNew,
      isRowsDynamic: isRowsDynamic,
      isColsDynamic: isColsDynamic,
      hasHeader: hasHeader,
      hasFooter: hasFooter,
      numRows: numRows,
      numCols: numCols,
      rows: rows,
      dynamicRowsQuestion: dynamicRowsQuestion);
}

class TableCodec extends Codec<Table, Map<String, dynamic>> {
  const TableCodec();
  @override
  Converter<Table, Map<String, dynamic>> get encoder => const TableEncoder();
  @override
  Converter<Map<String, dynamic>, Table> get decoder => const TableDecoder();
}

class TableEncoder extends Converter<Table, Map<String, dynamic>> {
  const TableEncoder();
  @override
  Map<String, dynamic> convert(Table data) => <String, dynamic>{
        'isNew': data?.isNew,
        'isRowsDynamic': data?.isRowsDynamic,
        'isColsDynamic': data?.isColsDynamic,
        'hasHeader': data?.hasHeader,
        'hasFooter': data?.hasFooter,
        'numRows': data?.numRows,
        'numCols': data?.numCols,
        'rows': data?.rows
            ?.map(const TableRowEncoder().convert)
            ?.toList(growable: false),
        'dynamicRowsQuestion': data == null || data.dynamicRowsQuestion == null
            ? null
            : const TableQuestionEncoder().convert(data.dynamicRowsQuestion),
      };
}

class TableDecoder extends Converter<Map<String, dynamic>, Table> {
  const TableDecoder();
  @override
  Table convert(Map<String, dynamic> data) => TableFactory.create(
        isNew: data['isNew'] as bool,
        isRowsDynamic: data['isRowsDynamic'] as bool,
        isColsDynamic: data['isColsDynamic'] as bool,
        hasHeader: data['hasHeader'] as bool,
        hasFooter: data['hasFooter'] as bool,
        numRows: data['numRows'] as int,
        numCols: data['numCols'] as int,
        rows: (data['rows'] as List<Map<String, dynamic>>)
            ?.map(const TableRowDecoder().convert)
            ?.toList(growable: false),
        dynamicRowsQuestion: data == null || data['dynamicRowsQuestion'] == null
            ? null
            : const TableQuestionDecoder()
                .convert(data['dynamicRowsQuestion'] as Map<String, dynamic>),
      );
}

class _Table$<T> extends ObjectSchema<T> {
  const _Table$(List<String> path$) : super(path$);
  ObjectSchema<bool> get isNew => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isNew'))
      : const <String>['isNew']);
  ObjectSchema<bool> get isRowsDynamic => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isRowsDynamic'))
      : const <String>['isRowsDynamic']);
  ObjectSchema<bool> get isColsDynamic => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isColsDynamic'))
      : const <String>['isColsDynamic']);
  ObjectSchema<bool> get hasHeader => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('hasHeader'))
      : const <String>['hasHeader']);
  ObjectSchema<bool> get hasFooter => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('hasFooter'))
      : const <String>['hasFooter']);
  ObjectSchema<int> get numRows => new ObjectSchema<int>(path$ != null
      ? (new List<String>.from(path$)..add('numRows'))
      : const <String>['numRows']);
  ObjectSchema<int> get numCols => new ObjectSchema<int>(path$ != null
      ? (new List<String>.from(path$)..add('numCols'))
      : const <String>['numCols']);
  ObjectSchema<List<TableRow>> get rows =>
      new ObjectSchema<List<TableRow>>(path$ != null
          ? (new List<String>.from(path$)..add('rows'))
          : const <String>['rows']);
  _TableQuestion$<TableQuestion> get dynamicRowsQuestion =>
      new _TableQuestion$<TableQuestion>(path$ != null
          ? (new List<String>.from(path$)..add('dynamicRowsQuestion'))
          : const <String>['dynamicRowsQuestion']);
}

Table tableLens<S>(Table entity, ObjectSchema<S> path(_Table$<Table> schema),
    S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _Table$<Table>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_tableTearOff];
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

  return newValue as Table;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class TableRow
// **************************************************************************

@immutable
class _TableRowImpl implements TableRow, TearOffAndValueObjectSchema {
  @override
  final int rowIndex;
  @override
  final List<TableColumn> columns;
  @override
  final bool isDynamic;
  const _TableRowImpl({this.rowIndex, this.columns, this.isDynamic});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'rowIndex':
        return rowIndex;
      case 'columns':
        return columns;
      case 'isDynamic':
        return isDynamic;
    }
    return null;
  }

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    this.columns?.forEach((TableColumn item) => item.expand(list));
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is TableRow && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(hash_combine(0, this.rowIndex.hashCode),
          hash_combineAll(this.columns)),
      this.isDynamic.hashCode));
  @override
  Map<String, dynamic> toJSON() => const TableRowEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'rowIndex':
        return null;
      case 'columns':
        return null;
      case 'isDynamic':
        return null;
    }
    return null;
  }
}

_TableRowImpl _tableRowTearOff(
        TableRow source, String property, dynamic value) =>
    new _TableRowImpl(
        rowIndex: property == 'rowIndex' ? value as int : source.rowIndex,
        columns:
            property == 'columns' ? value as List<TableColumn> : source.columns,
        isDynamic: property == 'isDynamic' ? value as bool : source.isDynamic);

class TableRowFactory {
  static TableRow create(
          {int rowIndex, List<TableColumn> columns, bool isDynamic}) =>
      new _TableRowImpl(
          rowIndex: rowIndex, columns: columns, isDynamic: isDynamic);
}

Uint8List writeTableRow(TableRow value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeInt(value.rowIndex));
  write(data, writeIterable(value.columns, writeTableColumn));
  write(data, writeBool(value.isDynamic));
  return new Uint8List.fromList(data);
}

TableRow readTableRow(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final int rowIndex = readInt(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final List<TableColumn> columns = readIterable(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)),
      readTableColumn);
  index += size + 1;
  size = data[index];
  final bool isDynamic = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _TableRowImpl(
      rowIndex: rowIndex, columns: columns, isDynamic: isDynamic);
}

class TableRowCodec extends Codec<TableRow, Map<String, dynamic>> {
  const TableRowCodec();
  @override
  Converter<TableRow, Map<String, dynamic>> get encoder =>
      const TableRowEncoder();
  @override
  Converter<Map<String, dynamic>, TableRow> get decoder =>
      const TableRowDecoder();
}

class TableRowEncoder extends Converter<TableRow, Map<String, dynamic>> {
  const TableRowEncoder();
  @override
  Map<String, dynamic> convert(TableRow data) => <String, dynamic>{
        'rowIndex': data?.rowIndex,
        'columns': data?.columns
            ?.map(const TableColumnEncoder().convert)
            ?.toList(growable: false),
        'isDynamic': data?.isDynamic,
      };
}

class TableRowDecoder extends Converter<Map<String, dynamic>, TableRow> {
  const TableRowDecoder();
  @override
  TableRow convert(Map<String, dynamic> data) => TableRowFactory.create(
        rowIndex: data['rowIndex'] as int,
        columns: (data['columns'] as List<Map<String, dynamic>>)
            ?.map(const TableColumnDecoder().convert)
            ?.toList(growable: false),
        isDynamic: data['isDynamic'] as bool,
      );
}

class _TableRow$<T> extends ObjectSchema<T> {
  const _TableRow$(List<String> path$) : super(path$);
  ObjectSchema<int> get rowIndex => new ObjectSchema<int>(path$ != null
      ? (new List<String>.from(path$)..add('rowIndex'))
      : const <String>['rowIndex']);
  ObjectSchema<List<TableColumn>> get columns =>
      new ObjectSchema<List<TableColumn>>(path$ != null
          ? (new List<String>.from(path$)..add('columns'))
          : const <String>['columns']);
  ObjectSchema<bool> get isDynamic => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isDynamic'))
      : const <String>['isDynamic']);
}

TableRow tableRowLens<S>(TableRow entity,
    ObjectSchema<S> path(_TableRow$<TableRow> schema), S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _TableRow$<TableRow>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_tableRowTearOff];
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

  return newValue as TableRow;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class TableColumn
// **************************************************************************

@immutable
class _TableColumnImpl implements TableColumn, TearOffAndValueObjectSchema {
  @override
  final int colIndex;
  @override
  final bool isDynamic;
  @override
  final bool isHeader;
  @override
  final bool isFooter;
  @override
  final String value;
  @override
  final TableVariable variable;
  const _TableColumnImpl(
      {this.colIndex,
      this.isDynamic,
      this.isHeader,
      this.isFooter,
      this.value,
      this.variable});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'colIndex':
        return colIndex;
      case 'isDynamic':
        return isDynamic;
      case 'isHeader':
        return isHeader;
      case 'isFooter':
        return isFooter;
      case 'value':
        return value;
      case 'variable':
        return variable;
    }
    return null;
  }

  @override
  List<TearOffAndValueObjectSchema> expand(
      [List<TearOffAndValueObjectSchema> list]) {
    list ??= <TearOffAndValueObjectSchema>[];
    list.add(this);
    if (variable != null) {
      this.variable.expand(list);
    }
    return list;
  }

  @override
  bool operator ==(Object other) =>
      other is TableColumn && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(hash_combine(
      hash_combine(
          hash_combine(
              hash_combine(
                  hash_combine(hash_combine(0, this.colIndex.hashCode),
                      this.isDynamic.hashCode),
                  this.isHeader.hashCode),
              this.isFooter.hashCode),
          this.value.hashCode),
      this.variable.hashCode));
  @override
  Map<String, dynamic> toJSON() => const TableColumnEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'colIndex':
        return null;
      case 'isDynamic':
        return null;
      case 'isHeader':
        return null;
      case 'isFooter':
        return null;
      case 'value':
        return null;
      case 'variable':
        return _tableVariableTearOff as Function(dynamic, String, dynamic);
    }
    return null;
  }
}

_TableColumnImpl _tableColumnTearOff(
        TableColumn source, String property, dynamic value) =>
    new _TableColumnImpl(
        colIndex: property == 'colIndex' ? value as int : source.colIndex,
        isDynamic: property == 'isDynamic' ? value as bool : source.isDynamic,
        isHeader: property == 'isHeader' ? value as bool : source.isHeader,
        isFooter: property == 'isFooter' ? value as bool : source.isFooter,
        value: property == 'value' ? value as String : source.value,
        variable:
            property == 'variable' ? value as TableVariable : source.variable);

class TableColumnFactory {
  static TableColumn create(
          {int colIndex,
          bool isDynamic,
          bool isHeader,
          bool isFooter,
          String value,
          TableVariable variable}) =>
      new _TableColumnImpl(
          colIndex: colIndex,
          isDynamic: isDynamic,
          isHeader: isHeader,
          isFooter: isFooter,
          value: value,
          variable: variable);
}

Uint8List writeTableColumn(TableColumn value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeInt(value.colIndex));
  write(data, writeBool(value.isDynamic));
  write(data, writeBool(value.isHeader));
  write(data, writeBool(value.isFooter));
  write(data, writeString(value.value));
  write(data, writeTableVariable(value.variable));
  return new Uint8List.fromList(data);
}

TableColumn readTableColumn(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final int colIndex = readInt(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool isDynamic = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool isHeader = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final bool isFooter = readBool(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final String value = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final TableVariable variable = readTableVariable(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _TableColumnImpl(
      colIndex: colIndex,
      isDynamic: isDynamic,
      isHeader: isHeader,
      isFooter: isFooter,
      value: value,
      variable: variable);
}

class TableColumnCodec extends Codec<TableColumn, Map<String, dynamic>> {
  const TableColumnCodec();
  @override
  Converter<TableColumn, Map<String, dynamic>> get encoder =>
      const TableColumnEncoder();
  @override
  Converter<Map<String, dynamic>, TableColumn> get decoder =>
      const TableColumnDecoder();
}

class TableColumnEncoder extends Converter<TableColumn, Map<String, dynamic>> {
  const TableColumnEncoder();
  @override
  Map<String, dynamic> convert(TableColumn data) => <String, dynamic>{
        'colIndex': data?.colIndex,
        'isDynamic': data?.isDynamic,
        'isHeader': data?.isHeader,
        'isFooter': data?.isFooter,
        'value': data?.value,
        'variable': data == null || data.variable == null
            ? null
            : const TableVariableEncoder().convert(data.variable),
      };
}

class TableColumnDecoder extends Converter<Map<String, dynamic>, TableColumn> {
  const TableColumnDecoder();
  @override
  TableColumn convert(Map<String, dynamic> data) => TableColumnFactory.create(
        colIndex: data['colIndex'] as int,
        isDynamic: data['isDynamic'] as bool,
        isHeader: data['isHeader'] as bool,
        isFooter: data['isFooter'] as bool,
        value: data['value'] as String,
        variable: data == null || data['variable'] == null
            ? null
            : const TableVariableDecoder()
                .convert(data['variable'] as Map<String, dynamic>),
      );
}

class _TableColumn$<T> extends ObjectSchema<T> {
  const _TableColumn$(List<String> path$) : super(path$);
  ObjectSchema<int> get colIndex => new ObjectSchema<int>(path$ != null
      ? (new List<String>.from(path$)..add('colIndex'))
      : const <String>['colIndex']);
  ObjectSchema<bool> get isDynamic => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isDynamic'))
      : const <String>['isDynamic']);
  ObjectSchema<bool> get isHeader => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isHeader'))
      : const <String>['isHeader']);
  ObjectSchema<bool> get isFooter => new ObjectSchema<bool>(path$ != null
      ? (new List<String>.from(path$)..add('isFooter'))
      : const <String>['isFooter']);
  ObjectSchema<String> get value => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('value'))
      : const <String>['value']);
  _TableVariable$<TableVariable> get variable =>
      new _TableVariable$<TableVariable>(path$ != null
          ? (new List<String>.from(path$)..add('variable'))
          : const <String>['variable']);
}

TableColumn tableColumnLens<S>(
    TableColumn entity,
    ObjectSchema<S> path(_TableColumn$<TableColumn> schema),
    S swapper(S oldValue)) {
  final ObjectSchema<S> schema = path(const _TableColumn$<TableColumn>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_tableColumnTearOff];
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

  return newValue as TableColumn;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class TableQuestion
// **************************************************************************

@immutable
class _TableQuestionImpl implements TableQuestion, TearOffAndValueObjectSchema {
  @override
  final String id;
  @override
  final String question;
  const _TableQuestionImpl({this.id, this.question});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'id':
        return id;
      case 'question':
        return question;
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
      other is TableQuestion && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(
      hash_combine(hash_combine(0, this.id.hashCode), this.question.hashCode));
  @override
  Map<String, dynamic> toJSON() => const TableQuestionEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'id':
        return null;
      case 'question':
        return null;
    }
    return null;
  }
}

_TableQuestionImpl _tableQuestionTearOff(
        TableQuestion source, String property, dynamic value) =>
    new _TableQuestionImpl(
        id: property == 'id' ? value as String : source.id,
        question: property == 'question' ? value as String : source.question);

class TableQuestionFactory {
  static TableQuestion create({String id, String question}) =>
      new _TableQuestionImpl(id: id, question: question);
}

Uint8List writeTableQuestion(TableQuestion value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.id));
  write(data, writeString(value.question));
  return new Uint8List.fromList(data);
}

TableQuestion readTableQuestion(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String id = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final String question = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _TableQuestionImpl(id: id, question: question);
}

class TableQuestionCodec extends Codec<TableQuestion, Map<String, dynamic>> {
  const TableQuestionCodec();
  @override
  Converter<TableQuestion, Map<String, dynamic>> get encoder =>
      const TableQuestionEncoder();
  @override
  Converter<Map<String, dynamic>, TableQuestion> get decoder =>
      const TableQuestionDecoder();
}

class TableQuestionEncoder
    extends Converter<TableQuestion, Map<String, dynamic>> {
  const TableQuestionEncoder();
  @override
  Map<String, dynamic> convert(TableQuestion data) => <String, dynamic>{
        'id': data?.id,
        'question': data?.question,
      };
}

class TableQuestionDecoder
    extends Converter<Map<String, dynamic>, TableQuestion> {
  const TableQuestionDecoder();
  @override
  TableQuestion convert(Map<String, dynamic> data) =>
      TableQuestionFactory.create(
        id: data['id'] as String,
        question: data['question'] as String,
      );
}

class _TableQuestion$<T> extends ObjectSchema<T> {
  const _TableQuestion$(List<String> path$) : super(path$);
  ObjectSchema<String> get id => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('id'))
      : const <String>['id']);
  ObjectSchema<String> get question => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('question'))
      : const <String>['question']);
}

TableQuestion tableQuestionLens<S>(
    TableQuestion entity,
    ObjectSchema<S> path(_TableQuestion$<TableQuestion> schema),
    S swapper(S oldValue)) {
  final ObjectSchema<S> schema =
      path(const _TableQuestion$<TableQuestion>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_tableQuestionTearOff];
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

  return newValue as TableQuestion;
}

// **************************************************************************
// Generator: ClassGenerator
// Target: abstract class TableVariable
// **************************************************************************

@immutable
class _TableVariableImpl implements TableVariable, TearOffAndValueObjectSchema {
  @override
  final String id;
  @override
  final String label;
  const _TableVariableImpl({this.id, this.label});
  @override
  dynamic getValueFromKey(String key) {
    switch (key) {
      case 'id':
        return id;
      case 'label':
        return label;
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
      other is TableVariable && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(
      hash_combine(hash_combine(0, this.id.hashCode), this.label.hashCode));
  @override
  Map<String, dynamic> toJSON() => const TableVariableEncoder().convert(this);
  @override
  Function(dynamic, String, dynamic) getTearOffForKey(String key) {
    switch (key) {
      case 'id':
        return null;
      case 'label':
        return null;
    }
    return null;
  }
}

_TableVariableImpl _tableVariableTearOff(
        TableVariable source, String property, dynamic value) =>
    new _TableVariableImpl(
        id: property == 'id' ? value as String : source.id,
        label: property == 'label' ? value as String : source.label);

class TableVariableFactory {
  static TableVariable create({String id, String label}) =>
      new _TableVariableImpl(id: id, label: label);
}

Uint8List writeTableVariable(TableVariable value) {
  if (value == null) return new Uint8List.fromList(const <int>[0]);
  final List<int> data = <int>[1];
  write(data, writeString(value.id));
  write(data, writeString(value.label));
  return new Uint8List.fromList(data);
}

TableVariable readTableVariable(Uint8List data) {
  if (data[0] == 0) return null;
  int index = 1, size;
  size = data[index];
  final String id = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  size = data[index];
  final String label = readString(
      new Uint8List.fromList(data.sublist(index + 1, index + size + 1)));
  index += size + 1;
  return new _TableVariableImpl(id: id, label: label);
}

class TableVariableCodec extends Codec<TableVariable, Map<String, dynamic>> {
  const TableVariableCodec();
  @override
  Converter<TableVariable, Map<String, dynamic>> get encoder =>
      const TableVariableEncoder();
  @override
  Converter<Map<String, dynamic>, TableVariable> get decoder =>
      const TableVariableDecoder();
}

class TableVariableEncoder
    extends Converter<TableVariable, Map<String, dynamic>> {
  const TableVariableEncoder();
  @override
  Map<String, dynamic> convert(TableVariable data) => <String, dynamic>{
        'id': data?.id,
        'label': data?.label,
      };
}

class TableVariableDecoder
    extends Converter<Map<String, dynamic>, TableVariable> {
  const TableVariableDecoder();
  @override
  TableVariable convert(Map<String, dynamic> data) =>
      TableVariableFactory.create(
        id: data['id'] as String,
        label: data['label'] as String,
      );
}

class _TableVariable$<T> extends ObjectSchema<T> {
  const _TableVariable$(List<String> path$) : super(path$);
  ObjectSchema<String> get id => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('id'))
      : const <String>['id']);
  ObjectSchema<String> get label => new ObjectSchema<String>(path$ != null
      ? (new List<String>.from(path$)..add('label'))
      : const <String>['label']);
}

TableVariable tableVariableLens<S>(
    TableVariable entity,
    ObjectSchema<S> path(_TableVariable$<TableVariable> schema),
    S swapper(S oldValue)) {
  final ObjectSchema<S> schema =
      path(const _TableVariable$<TableVariable>(null));
  final List<dynamic> values = <dynamic>[entity];
  final List<dynamic> tearOffs = <dynamic>[_tableVariableTearOff];
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

  return newValue as TableVariable;
}
