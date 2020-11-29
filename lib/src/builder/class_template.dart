// ignore: import_of_legacy_library_into_null_safe
import 'package:analyzer/dart/element/element.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:analyzer/dart/element/type.dart';

class ClassTemplate {
  final List<PropertyAccessorElement> _allAccessors =
          <PropertyAccessorElement>[],
      _ownAccessors = <PropertyAccessorElement>[];

  ClassTemplate({required this.name, required this.supertype});

  String name;
  InterfaceType supertype;

  void addAccessor(PropertyAccessorElement accessor, bool ownsAccessor) {
    if (ownsAccessor) {
      _ownAccessors.add(accessor);
    }

    _allAccessors.add(accessor);
  }

  String build() {
    final buffer = StringBuffer();

    buffer.write('class ${_createFactoryName()} {');

    buffer.write('const ${_createFactoryName()}();');

    buffer.write(
        '${supertype.getDisplayString(withNullability: true)} createNew({${_createFactoryArgs()}}) => new ${_createClassName()}(${_createCtrFromArgs()});');

    buffer.write('}');

    if (supertype.element.isAbstract) {
      buffer.write(
          'class ${_createClassName()} implements ${supertype.getDisplayString(withNullability: true)} {');
    } else {
      buffer.write(
          'class ${_createClassName()} extends ${supertype.getDisplayString(withNullability: true)} {');
    }

    _ownAccessors.forEach((PropertyAccessorElement accessor) {
      buffer.write(
          '@override final ${accessor.returnType.getDisplayString(withNullability: true)} ${accessor.name};');
    });

    buffer.write('${_createClassName()}({${_createCtrArgs()}});');

    buffer.write('}');

    return buffer.toString();
  }

  String _createFactoryName() {
    return '${name}Factory';
  }

  String _createClassName() {
    return '_${name}Impl';
  }

  String _createFactoryArgs() {
    return _allAccessors
        .map((PropertyAccessorElement accessor) =>
            '${accessor.returnType.getDisplayString(withNullability: true)} ${accessor.name}')
        .join(',');
  }

  String _createCtrFromArgs() {
    return _allAccessors
        .map((PropertyAccessorElement accessor) =>
            '${accessor.name}:${accessor.name}')
        .join(',');
  }

  String _createCtrArgs() {
    return _allAccessors
        .map((PropertyAccessorElement accessor) => 'this.${accessor.name}')
        .join(',');
  }
}
