//多线程
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'dart:async';
import 'dart:isolate';

class MultiThreadDemo extends StatefulWidget {
  MultiThreadDemo({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MultiThreadDemoState();
  }
}

class _MultiThreadDemoState extends State<MultiThreadDemo> {
  List widgets = [];
  bool showLoadingDialog = true;

  @override
  void initState() {
    //
    super.initState();
    loadData();
  }

  getBody() {
    if (showLoadingDialog) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return getListView();
    }
  }

  ListView getListView() => ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return getRowItem(index);
        },
      );

  getRowItem(int index) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[index]["title"]}"),
    );
  }

  loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    //SendPort
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
      showLoadingDialog = false;
    });
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

  //它自己的独立执行线程中运行的隔离区
  static dataLoader(SendPort sendPort) async {
    ReceivePort port = new ReceivePort();
    sendPort.send(port.sendPort);
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(json.decode(response.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("多线程"),
      ),
      body: getBody(),
    );
  }
}
