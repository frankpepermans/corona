import 'dart:async';

import 'package:source_gen/source_gen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:build/build.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:analyzer/dart/element/element.dart';

import 'package:corona/src/builder/template/declaration.dart';
import 'package:corona/src/builder/template/schema.dart';

class ClassGenerator extends Generator {
  const ClassGenerator();

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final path = buildStep.inputId.path.split('/').sublist(1).join('/');
    final element = library.allElements.whereType<ClassElement?>().firstWhere(
        (element) => element!.location.components.first.contains(path),
        orElse: () => null);

    if (element == null) return '';

    if (element.isAbstract) {
      final buffer = StringBuffer();
      const decl = DeclarationDecoder<ClassElement>();
      const schema = SchemaDecoder<ClassElement>();

      buffer.write(decl.convert(element));
      buffer.write(schema.convert(element));

      return buffer.toString();
    }

    return '';
  }
}
