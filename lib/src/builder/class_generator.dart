import 'dart:async';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:corona/src/builder/template/declaration.dart';
import 'package:corona/src/builder/template/schema.dart';

typedef T TearOff<T>(T source, String property, dynamic value);

class ClassGenerator extends Generator {

  const ClassGenerator();

  @override
  Future<String> generate(Element element, _) async {
    if (element is ClassElement) {
      final StringBuffer buffer = new StringBuffer();
      const DeclarationDecoder<ClassElement, String> decl = const DeclarationDecoder<ClassElement, String>();
      const SchemaDecoder<ClassElement, String> schema = const SchemaDecoder<ClassElement, String>();

      buffer.write(decl.convert(element));
      buffer.write(schema.convert(element));

      return buffer.toString();
    }

    return null;
  }

}