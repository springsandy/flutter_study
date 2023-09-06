import 'dart:async';

import 'package:lib/study_lib.dart';

class T2 extends ITextTest {
  @override
  String get authorName => 'BomI';

  @override
  void setInput(List<String> args) {}

  var twoDList = List<List>.generate(
      20, (index) => List<String>.generate(40, (index) => '_', growable: false),
      growable: false);
  int k_col = 0;
  double delta_sec_sum = 0;

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    final output = <String>[];
    final buffer = StringBuffer();

    final delta_sec = delta.inMilliseconds / 1000.0;
    output.add('${delta_sec}');

    if (delta_sec_sum < 0.5) {
      up(k_col, delta_sec);
    } else if (delta_sec_sum > 0.5 && delta_sec_sum < 1.0) {
      down(k_col, delta_sec);
    } else {
      delta_sec_sum = 0;
    }

    for (var i = 0; i < 20; i++) {
      for (var j = 0; j < 40; j++) {
        buffer.write('${twoDList[i][j]}');
      }
      buffer.writeln();
    }
    output.add('${delta_sec_sum}');
    output.add('${buffer}');

    return output;
  }

  void up(int k_col, double delta_sec) {
    if (k_col >= 18) {
      this.delta_sec_sum = 0.51;
    }

    if (k_col > 0 && k_col < 20) {
      twoDList[k_col - 1][5] = '_';
    }

    twoDList[k_col][5] = 'k';
    this.k_col = ++k_col;
    this.delta_sec_sum += delta_sec;
  }

  void down(int k_col, double delta_sec) {
    if (k_col != 0) {
      twoDList[k_col][5] = '_';
      this.k_col = --k_col;
      twoDList[k_col][5] = 'k';
      this.delta_sec_sum += delta_sec;
    } else if (k_col == 0) {
      this.delta_sec_sum = 0;
    }
  }
}
