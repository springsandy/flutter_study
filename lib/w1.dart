import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib/study_lib.dart';

class W1 extends IWidgetTest {
  @override
  String get authorName => 'BomI';

  @override
  StatefulWidget createWidget(BuildContext context, Key key) {
    return MyWidgetTestWidget(key: key);
  }
}

class MyWidgetTestWidget extends StatefulWidget {
  const MyWidgetTestWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MyWidgetTestWidget();
}

class _MyWidgetTestWidget extends State<MyWidgetTestWidget>
    implements ITickerState {
  Duration elapsed = Duration.zero;
  final _random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Color? random_color = Colors.red;

    return GestureDetector(
      onTap: () {
        setState(() {
          print('aaa');
          random_color =
              Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  [Random().nextInt(9) * 100];
          print(random_color);
        });
      },
      child: Container(
        width: width / 2,
        height: 50,
        decoration: BoxDecoration(
          color: random_color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  void onTick(Duration elapsed, Duration delta) {
    safeSetState(() {
      this.elapsed = elapsed;
    });
  }
}
