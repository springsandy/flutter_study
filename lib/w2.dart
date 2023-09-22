import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib/study_lib.dart';

class W2 extends IWidgetTest {
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

    return Center(
      child: Container(
        width: width / 2,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 185, 234, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 228, 255),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 49, 111, 174),
                  width: 2,
                ),
              ),
            ),
            Container(
              width: width / 2 * 0.7,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '냥냥이',
                    style: TextStyle(
                      color: Color.fromARGB(255, 49, 111, 174),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '냐옹이는 귀여워',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 142, 154),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width / 2 * 0.1,
              child: const Icon(
                Icons.arrow_forward,
                size: 30,
                color: Color.fromARGB(255, 49, 111, 174),
              ),
            ),
          ],
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
