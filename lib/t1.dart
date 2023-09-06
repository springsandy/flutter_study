import 'package:flutter/material.dart';
import 'package:lib/study_lib.dart';

class T1 extends ITextTest {
  @override
  String get authorName => 'BomI';

  @override
  List<String> getOutput(Duration elapsed, Duration delta) {
    final output = <String>[];

    for (var col = 1; col <= 20; col++) {
      output.add('♥' * col);
    }

    return output;
  }

  @override
  void setInput(List<String> args) {}
}
