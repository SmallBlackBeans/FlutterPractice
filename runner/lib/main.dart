import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'const/strings.dart';
import 'project_list.dart';

/* 
  Dart 应用是单线程的，但是 Dart 支持代码运行在其它线程上，同时也支持使用 async/await 模式让代码异步执行，而不会阻塞 UI 线程。
 */
void main() {
  //可视化调试
//  debugPaintSizeEnabled = true;
  //开启集成测试 启用扩展
  enableFlutterDriverExtension();
  // showPerformanceOverlay = true;
//services
//debugPrintMarkNeedsLayoutStacks();
//debugPrintMarkNeedsPaintStacks();
  runApp(new AwesomeTips());
}

class AwesomeTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
//          brightness: Brightness.dark,
          primaryColor: Colors.yellow.shade800,
          textSelectionColor: Colors.blueGrey,
          accentColor: Colors.cyan[600]),
      title: Strings.appTitle,
      home: ProjectListWidget(),
    );
  }
// }
}
