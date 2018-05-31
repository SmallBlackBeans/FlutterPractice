import 'package:flutter/material.dart';
import 'const/strings.dart';
import 'project_list.dart';

/* 
  Dart 应用是单线程的，但是 Dart 支持代码运行在其它线程上，同时也支持使用 async/await 模式让代码异步执行，而不会阻塞 UI 线程。
 */
void main() => runApp(new AwesomeTips());

class AwesomeTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.yellow.shade800,
          accentColor: Colors.cyan[600]),
      title: Strings.appTitle,
      home: ProjectListWidget(),
    );
  }
  // }
}
