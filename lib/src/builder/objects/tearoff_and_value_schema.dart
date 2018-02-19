import 'package:corona/src/builder/class_generator.dart' show TearOff;

abstract class TearOffAndValueObjectSchema {

  dynamic getValueFromKey(String key);

  TearOff<dynamic> getTearOffForKey(String key);

}