import 'package:build_runner/build_runner.dart';

import 'package:corona/corona.dart';
import 'package:source_gen/source_gen.dart';

final PhaseGroup phases = new PhaseGroup.singleAction(
    new GeneratorBuilder(const <Generator>[
      const ClassGenerator()
    ], isStandalone: false),
    new InputSet('corona',
        const <String>['test/objects/*.dart']));