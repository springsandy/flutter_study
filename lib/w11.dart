import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib/study_lib.dart';

class W11 extends IWidgetTest {
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
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width / 2,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Container(
        //   width: width / 2,
        //   height: 50,
        //   decoration: BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
      ],
    );
  }

  @override
  void onTick(Duration elapsed, Duration delta) {
    safeSetState(() {
      this.elapsed = elapsed;
    });
  }
}
