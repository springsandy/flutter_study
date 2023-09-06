// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib/study_lib.dart';

class W0 extends IWidgetTest {
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
    return Center(
      child: Text(
        'Test ${elapsed.inMilliseconds}ms',
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
