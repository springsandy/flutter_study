import 'package:lib/study_lib.dart';

class T3 extends ITextTest {
  @override
  String get authorName => 'BomI';

  @override
  void setInput(List<String> args) {}

  var twoDList = List<List>.generate(
      20, (index) => List<String>.generate(40, (index) => '_', growable: false),
      growable: false);
  int k_col = 0;
  int k_row = 0;
  int height = 0;
  double delta_sec_sum = 0;

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    final output = <String>[];
    final buffer = StringBuffer();

    final delta_sec = delta.inMilliseconds / 1000.0;
    output.add('${delta_sec}');
    print('k_col : ${k_col}, k_row : ${k_row}');

    // twoDList[k_col][k_row] = 'k';

    if (delta_sec_sum < 0.75) {
      right(k_col, k_row, delta_sec);
    } else if (delta_sec_sum > 0.76 && delta_sec_sum < 1.5) {
      left(k_col, k_row, delta_sec);
    } else {
      delta_sec_sum = 0;
    }
    output.add('${delta_sec_sum}');

    for (var i = 0; i < 20; i++) {
      for (var j = 0; j < 40; j++) {
        buffer.write('${twoDList[i][j]}');
      }
      buffer.writeln();
    }
    output.add('${buffer}');

    return output;
  }

  void right(int k_col, int k_row, double delta_sec) {
    twoDList[k_col][k_row] = '_';

    if (k_row >= 39) {
      this.delta_sec_sum = 0.751;
    }

    if (height == 0) {
      if (k_row == 19) {
        height = 1;
        k_row--;
      }
      k_row++;
    } else {
      if (k_row == 0) {
        height = 0;
        k_row++;
      }
      k_row--;
    }

    this.k_col = ++k_col;
    this.k_row = k_row;
    twoDList[this.k_col][this.k_row] = '_';
    this.delta_sec_sum += delta_sec;
  }

  void left(int k_col, int k_row, double delta_sec) {
    // if (k_col != 0 || k_row != 0) {
    //   twoDList[k_col][k_row] = 'a';
    //   this.k_col = k_col - 1;
    //   this.k_row = k_row + 1;
    //   twoDList[k_col][k_row] = 'k';
    //   this.delta_sec_sum += delta_sec;
    // } else if (k_col == 0 || k_row == 0) {
    //   this.delta_sec_sum = 0;
    // }
  }
}
