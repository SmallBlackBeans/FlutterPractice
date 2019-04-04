import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


//性能跟踪
void main() {
  group('滚动性能测试', () {
    FlutterDriver driver;

    setUpAll(() async {
      //连接到app
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('计算', () async {
      Timeline timeline = await driver.traceAction(() async {
        SerializableFinder userList = find.byValueKey('user-list');
        for (var i = 0; i < 5; i++) {
          await driver.scroll(
              userList, 0.0, -300.0, new Duration(milliseconds: 300));
          await new Future<Null>.delayed(new Duration(milliseconds: 500));
        }

        for (var i = 0; i < 5; i++) {
          await driver.scroll(
              userList, 0.0, 300.0, new Duration(milliseconds: 300));
          await new Future<Null>.delayed(new Duration(milliseconds: 500));
        }
      });
      TimelineSummary summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('stocks_scroll_perf', pretty: true);
      summary.writeTimelineToFile('stocks_scroll_perf', pretty: true);
    });
  });
}
