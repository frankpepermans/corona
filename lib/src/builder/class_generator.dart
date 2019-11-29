import 'dart:async';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'package:analyzer/dart/element/element.dart';

import 'package:corona/src/builder/template/declaration.dart';
import 'package:corona/src/builder/template/schema.dart';

class ClassGenerator extends Generator {
  const ClassGenerator();

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final path = buildStep.inputId.path.split('/').sublist(1).join('/');
    final ClassElement element = library.allElements.firstWhere(
        (Element element) =>
            element is ClassElement &&
            element.location.components.first.contains(path),
        orElse: () => null);

    if (element == null) return null;

    if (element.isAbstract) {
      final buffer = StringBuffer();
      const decl = const DeclarationDecoder<ClassElement, String>();
      const schema = const SchemaDecoder<ClassElement, String>();

      buffer.write(decl.convert(element));
      buffer.write(schema.convert(element));

      return buffer.toString();
    }

    return null;
  }
}
