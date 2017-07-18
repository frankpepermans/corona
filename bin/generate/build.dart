import 'dart:async';

import 'package:build/build.dart';
import 'package:build_runner/build_runner.dart';

import 'phases.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

bool test = true;

Future<dynamic> main() async {
  await build(phases, deleteFilesByDefault: true);
}