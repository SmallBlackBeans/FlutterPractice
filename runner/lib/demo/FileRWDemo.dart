import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';

class FileRWDemo extends StatefulWidget {
  FileRWDemo({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    //
    return _FileRWDemoState();
  }
}

class _FileRWDemoState extends State<FileRWDemo> {
  int _counter;
  @override
  void initState() {
    //
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

//Future 代表一个延迟计算 可以是文件读取或者 网络获取
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException catch (_) {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
      appBar: AppBar(
        title: Text('计数器本地存取'),
      ),
      body: new Center(
        child: new Text('按钮点击 $_counter 次'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }
}
