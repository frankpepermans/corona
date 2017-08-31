const decl = const Decl();

String get ctrNew => 'new';
String get ctrConst => 'const';
String get thisRef => 'this';

String get space => ' ';

String get argsOpen => '(';
String get argsClose => ')';

String get bracketsOpen => '{';
String get bracketsClose => '}';

String get listOpen => '[';
String get listClose => ']';

String get typeOpen => '<';
String get typeClose => '>';

String get getter => 'get';

String get fatArrow => '=>';

String get closeLine => ';';
String get ddot => ':';
String get equals => '=';

class Decl {

  const Decl();

  String get forClass => 'class';
  String get forExtends => 'extends';
  String get forImplements => 'implements';
  String get forMixins => 'with';
  String get forFinal => 'final';
  String get forFactory => 'factory';
  String get forReturn => 'return';
  String get forDynamic => 'dynamic';
  String get forVoid => 'void';
  String get forStatic => 'static';

}