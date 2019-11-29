import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:corona/src/builder/template/helpers/naming.dart' as naming;
import 'package:corona/src/builder/template/helpers/tokens.dart' as tokens;

class SchemaDecoder<S extends ClassElement, T extends String>
    extends Converter<S, T> {
  const SchemaDecoder();

  @override
  T convert(S input) {
    final StringBuffer buffer = new StringBuffer();
    final Set<PropertyAccessorElement> accessors =
        new Set<PropertyAccessorElement>.from(input.accessors);

    buffer.write('extension');
    buffer.write(tokens.space);
    buffer.write(naming.getLensName(input.displayName));
    buffer.write(tokens.space);
    buffer.write('on');
    buffer.write(tokens.space);
    buffer.write(input.displayName);
    buffer.write(tokens.space);
    buffer.writeln(tokens.bracketsOpen);

    accessors.where((accessor) => accessor.isGetter).forEach((accessor) {
      buffer.write(input.displayName);
      buffer.write(tokens.space);
      buffer.write(naming.getLensPropertyName(accessor.displayName));
      buffer.write(tokens.argsOpen);
      buffer.write(accessor.returnType.displayName);
      buffer.write(tokens.space);
      buffer.write('value');
      buffer.write(tokens.argsClose);
      buffer.write(tokens.space);
      buffer.write(tokens.fatArrow);
      buffer.write(tokens.space);
      buffer.write(naming.getFactoryName(input.displayName));
      buffer.write(tokens.dot);
      buffer.write('create');
      buffer.write(tokens.argsOpen);

      buffer.write(accessors.where((acc) => acc.isGetter).map((acc) {
        if (acc == accessor) {
          return '${acc.displayName}: value';
        }

        return '${acc.displayName}: this.${acc.displayName}';
      }).join(', '));

      buffer.write(tokens.argsClose);
      buffer.writeln(tokens.closeLine);
    });

    buffer.write(tokens.bracketsClose);

    return buffer.toString();
  }
}
