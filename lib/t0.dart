import 'package:lib/study_lib.dart';

class T0 extends ITextTest {
  @override
  String get authorName => 'sandy';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
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

    if (output.isEmpty) return [''];

    return output;
  }

  List<String> inputStrs = [];

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
