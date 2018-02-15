import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:corona/src/builder/template/helpers/naming.dart' as naming;
import 'package:corona/src/builder/template/helpers/tokens.dart' as tokens;

class DeclarationDecoder<S extends ClassElement, T extends String>
    extends Converter<S, T> {
  const DeclarationDecoder();

  @override
  T convert(S input) {
    final StringBuffer buffer = new StringBuffer();
    final List<InterfaceType> interfaces = <InterfaceType>[input.type];

    buffer.writeln('@immutable');
    buffer.write(tokens.decl.forClass);
    buffer.write(tokens.space);
    buffer.write(naming.getImplClassName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input).join(', '));
      buffer.write(tokens.typeClose);
    }

    if (!input.supertype.isObject || input.mixins.isNotEmpty) {
      if (input.supertype.element.isAbstract) {
        interfaces.add(input.supertype);

        buffer.write(tokens.space);
        buffer.write(tokens.decl.forExtends);
        buffer.write(tokens.space);
        buffer.write('Object');
      } else {
        buffer.write(tokens.space);
        buffer.write(tokens.decl.forExtends);
        buffer.write(tokens.space);
        buffer.write(input.supertype.displayName);
      }
    }

    if (input.mixins.isNotEmpty) {
      buffer.write(tokens.space);
      buffer.write(tokens.decl.forMixins);
      buffer.write(tokens.space);
      buffer.write(input.mixins
          .map((InterfaceType type) => type.displayName)
          .join(', '));
    }

    interfaces.addAll(input.interfaces);

    if (interfaces.isNotEmpty) {
      buffer.write(tokens.space);
      buffer.write(tokens.decl.forImplements);
      buffer.write(tokens.space);
      buffer.write(
          interfaces.map((InterfaceType type) => type.displayName).join(', '));
    }

    buffer.write(tokens.bracketsOpen);

    final Set<PropertyAccessorElement> accessors =
        new Set<PropertyAccessorElement>();

    interfaces
        .map((InterfaceType type) => type.accessors)
        .forEach(accessors.addAll);

    accessors.forEach((PropertyAccessorElement accessor) {
      buffer.write('@override ');
      buffer.write(tokens.decl.forFinal);
      buffer.write(tokens.space);
      buffer.write(accessor.returnType.displayName);
      buffer.write(tokens.space);
      buffer.write(accessor.displayName);
      buffer.write(tokens.closeLine);
    });

    buffer.write(tokens.ctrConst);
    buffer.write(tokens.space);
    buffer.write(naming.getImplClassName(input.displayName));
    buffer.write(tokens.argsOpen);

    if (accessors.isNotEmpty) {
      buffer.write(tokens.bracketsOpen);

      buffer.write(accessors
          .map((PropertyAccessorElement accessor) =>
              'this.${accessor.displayName}')
          .join(','));

      buffer.write(tokens.bracketsClose);
    }

    buffer.write(tokens.argsClose);
    buffer.write(tokens.closeLine);

    buffer.write(tokens.decl.forDynamic);
    buffer.write(tokens.space);
    buffer.write('_getValueFromKey');
    buffer.write(tokens.argsOpen);
    buffer.write('String key');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.bracketsOpen);
    buffer.write('switch (key)');
    buffer.write(tokens.bracketsOpen);

    accessors.forEach((PropertyAccessorElement accessor) {
      buffer.write('case');
      buffer.write(tokens.space);
      buffer.write(
          ''' '${accessor.displayName}':return ${accessor.displayName} ''');
      buffer.write(tokens.closeLine);
    });

    buffer.write(tokens.bracketsClose);

    buffer.write(tokens.decl.forReturn);
    buffer.write(tokens.space);
    buffer.write('null');
    buffer.write(tokens.closeLine);
    buffer.write(tokens.bracketsClose);

    buffer.write('TearOff<dynamic>');
    buffer.write(tokens.space);
    buffer.write('_getTearOffForKey');
    buffer.write(tokens.argsOpen);
    buffer.write('String key');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.bracketsOpen);
    buffer.write('switch (key)');
    buffer.write(tokens.bracketsOpen);

    accessors.forEach((PropertyAccessorElement accessor) {
      if (accessor.isGetter) {
        buffer.write('''case '${accessor.displayName}': ''');

        if (accessor.returnType.element.kind.ordinal > 0) {
          buffer.write(tokens.decl.forReturn);
          buffer.write(tokens.space);
          buffer.write('null');
          buffer.write(tokens.closeLine);
        } else if (accessor.returnType.element.library.displayName ==
            input.library.displayName) {
          buffer.write(tokens.decl.forReturn);
          buffer.write(tokens.space);
          buffer
              .write(naming.getCtrTearOffName(accessor.returnType.displayName));
          buffer.write(tokens.closeLine);
        } else {
          buffer.write(tokens.decl.forReturn);
          buffer.write(tokens.space);
          buffer.write('null');
          buffer.write(tokens.closeLine);
        }
      }
    });

    buffer.write(tokens.bracketsClose);

    buffer.write(tokens.decl.forReturn);
    buffer.write(tokens.space);
    buffer.write('null');
    buffer.write(tokens.closeLine);

    buffer.write(tokens.bracketsClose);

    buffer.write(tokens.bracketsClose);

    buffer.write(naming.getImplClassName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input)
          .map((_GenericTypeDecl decl) => decl.name)
          .join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.space);
    buffer.write(naming.getCtrTearOffName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input).join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.argsOpen);
    buffer.write(
        '${input.type.displayName} source, String property, dynamic value');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.fatArrow);

    buffer.write(tokens.ctrNew);
    buffer.write(tokens.space);
    buffer.write(naming.getImplClassName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input)
          .map((_GenericTypeDecl decl) => decl.name)
          .join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.argsOpen);

    if (accessors.isNotEmpty) {
      buffer.write(accessors
          .map((PropertyAccessorElement accessor) =>
              '''${accessor.displayName}: property == '${accessor.displayName}' ? value : source.${accessor.displayName}''')
          .join(','));
    }

    buffer.write(tokens.argsClose);
    buffer.write(tokens.closeLine);

    buffer.write(tokens.decl.forClass);
    buffer.write(tokens.space);
    buffer.write(naming.getFactoryName(input.displayName));

    buffer.write(tokens.bracketsOpen);

    buffer.write(tokens.decl.forStatic);
    buffer.write(tokens.space);
    buffer.write(input.displayName);

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input)
          .map((_GenericTypeDecl decl) => decl.name)
          .join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.space);
    buffer.write('create');

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input).join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.argsOpen);

    if (accessors.isNotEmpty) {
      buffer.write(tokens.bracketsOpen);

      buffer.write(accessors
          .map((PropertyAccessorElement accessor) =>
              '${accessor.returnType.displayName} ${accessor.displayName}')
          .join(','));

      buffer.write(tokens.bracketsClose);
    }

    buffer.write(tokens.argsClose);

    buffer.write(tokens.fatArrow);
    buffer.write(tokens.ctrNew);
    buffer.write(tokens.space);
    buffer.write(naming.getImplClassName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input)
          .map((_GenericTypeDecl decl) => decl.name)
          .join(', '));
      buffer.write(tokens.typeClose);
    }

    buffer.write(tokens.argsOpen);

    if (accessors.isNotEmpty) {
      buffer.write(accessors
          .map((PropertyAccessorElement accessor) =>
              '${accessor.displayName}:${accessor.displayName}')
          .join(','));
    }

    buffer.write(tokens.argsClose);
    buffer.write(tokens.closeLine);

    buffer.write(tokens.bracketsClose);

    buffer.write('Uint8List');
    buffer.write(tokens.space);
    buffer.write(naming.getWriterName(input.displayName));
    buffer.write(tokens.argsOpen);
    buffer.write('${input.displayName} value');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.bracketsOpen);

    buffer.write(
        'if (value == null) return new Uint8List.fromList(const <int>[0]);');
    buffer.write('final List<int> data = <int>[1];');

    accessors.forEach((PropertyAccessorElement accessor) {
      _CodecData data =
          _toWritableData(accessor.returnType.displayName, accessor.returnType);

      if (data.encoder != null) {
        buffer.write(
            'write(data, ${data.method}(value.${accessor.displayName}, ${data.encoder}));');
      } else {
        buffer.write(
            'write(data, ${data.method}(value.${accessor.displayName}));');
      }
    });

    buffer.write('return new Uint8List.fromList(data);');

    buffer.write(tokens.bracketsClose);

    buffer.write(input.displayName);
    buffer.write(tokens.space);
    buffer.write(naming.getReaderName(input.displayName));
    buffer.write(tokens.argsOpen);
    buffer.write('Uint8List data');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.bracketsOpen);

    buffer.write('if (data[0] == 0) return null;');
    buffer.write('int index = 1, size;');

    accessors.forEach((PropertyAccessorElement accessor) {
      _CodecData data =
          _toReadableData(accessor.returnType.displayName, accessor.returnType);

      buffer.write('size = data[index];');

      if (data.encoder != null) {
        buffer.write(
            'final ${accessor.returnType.displayName} ${accessor.displayName} = ${data.method}(data.sublist(index + 1, index + size + 1), ${data.encoder});');
      } else {
        buffer.write(
            'final ${accessor.returnType.displayName} ${accessor.displayName} = ${data.method}(data.sublist(index + 1, index + size + 1));');
      }

      buffer.write('index += size + 1;');
    });

    buffer.write('return new ${naming.getImplClassName(input.displayName)}(');

    buffer.write(accessors
        .map((PropertyAccessorElement accessor) =>
            '${accessor.displayName}: ${accessor.displayName}')
        .join(','));

    buffer.write(');');

    buffer.write(tokens.bracketsClose);

    return buffer.toString();
  }

  _CodecData _toReadableData(String displayName, DartType type) {
    switch (displayName) {
      case 'int':
        return new _CodecData('readInt');
      case 'double':
        return new _CodecData('readDouble');
      case 'String':
        return new _CodecData('readString');
      case 'DateTime':
        return new _CodecData('readDateTime');
      case 'bool':
        return new _CodecData('readBool');
      default:
        if (type.element is ClassElement) {
          ClassElement elmCast = type.element;

          final InterfaceType iterableType = elmCast.allSupertypes.firstWhere(
              (InterfaceType type) =>
                  type.element.library.isDartCore && type.name == 'Iterable',
              orElse: () => null);

          if (iterableType != null) {
            final InterfaceType interfaceType = type;

            _CodecData data = _toReadableData(
                interfaceType.typeArguments.first.displayName,
                interfaceType.typeArguments.first);

            return new _CodecData('readIterable', data.method);
          } else {
            return new _CodecData('read${type.name}');
          }
        }

        break;
    }

    return null;
  }

  _CodecData _toWritableData(String displayName, DartType type) {
    switch (displayName) {
      case 'int':
        return new _CodecData('writeInt');
      case 'double':
        return new _CodecData('writeDouble');
      case 'String':
        return new _CodecData('writeString');
      case 'DateTime':
        return new _CodecData('writeDateTime');
      case 'bool':
        return new _CodecData('writeBool');
      default:
        if (type.element is ClassElement) {
          ClassElement elmCast = type.element;

          final InterfaceType iterableType = elmCast.allSupertypes.firstWhere(
              (InterfaceType type) =>
                  type.element.library.isDartCore && type.name == 'Iterable',
              orElse: () => null);

          if (iterableType != null) {
            final InterfaceType interfaceType = type;

            _CodecData data = _toWritableData(
                interfaceType.typeArguments.first.displayName,
                interfaceType.typeArguments.first);

            return new _CodecData('writeIterable', data.method);
          } else {
            return new _CodecData('write${type.name}');
          }
        }

        break;
    }

    return null;
  }

  bool _hasGenericTypes(S input) => input.type.typeParameters.isNotEmpty;

  Iterable<_GenericTypeDecl> _getGenericTypeDecl(S input) {
    final List<_GenericTypeDecl> list = <_GenericTypeDecl>[];

    input.type.typeParameters.forEach((TypeParameterElement t) {
      list.add(new _GenericTypeDecl(t.displayName, t.bound.displayName));
    });

    return list;
  }
}

class _GenericTypeDecl {
  final String name, ext;

  _GenericTypeDecl(this.name, this.ext);

  String toString() => '$name extends $ext';
}

class _CodecData {
  final String method;
  final String encoder;

  _CodecData(this.method, [this.encoder]);
}
