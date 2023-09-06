import 'package:lib/study_lib.dart';

class T0 extends ITextTest {
  @override
  String get authorName => 'BomI';

  List<String> inputStrs = [];

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    //리스트 비었는지 확인
    if (inputStrs.isEmpty) {
      return ['', ''];
    }

    final output = <String>[];

    for (final str in inputStrs) {
      try {
        output.add(makeTable9(int.parse(str)));
        output.add('\n');
      } catch (e, s) {
        'FAILED $e, $s'.ilog();
      }
    }

    //리스트 비었는지 확인
    if (output.isEmpty) {
      return [''];
    }

    return output;
  }

  @override
  void setInput(List<String> args) {
    this.inputStrs = args;
  }

  String makeTable9(int parse) {
    final buffer = StringBuffer('$parse단\n');
    for (var i = 1; i <= 9; i++) {
      var multiply = parse * i;
      buffer.write('$parse X $i = $multiply\n');
    }
    return buffer.toString();
  }
}
