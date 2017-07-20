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
      buffer.write(''' '${accessor.displayName}':return ${accessor.displayName} ''');
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
        } else if (accessor.returnType.element.library.displayName == input.library.displayName) {
          buffer.write(tokens.decl.forReturn);
          buffer.write(tokens.space);
          buffer.write(naming.getCtrTearOffName(accessor.returnType.displayName));
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
      buffer.write(_getGenericTypeDecl(input).map((_GenericTypeDecl decl) => decl.name).join(', '));
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
    buffer.write('${input.type.displayName} source, String property, dynamic value');
    buffer.write(tokens.argsClose);
    buffer.write(tokens.fatArrow);

    buffer.write(tokens.ctrNew);
    buffer.write(tokens.space);
    buffer.write(naming.getImplClassName(input.displayName));

    if (_hasGenericTypes(input)) {
      buffer.write(tokens.typeOpen);
      buffer.write(_getGenericTypeDecl(input).map((_GenericTypeDecl decl) => decl.name).join(', '));
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
      buffer.write(_getGenericTypeDecl(input).map((_GenericTypeDecl decl) => decl.name).join(', '));
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
      buffer.write(_getGenericTypeDecl(input).map((_GenericTypeDecl decl) => decl.name).join(', '));
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

    return buffer.toString();
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
