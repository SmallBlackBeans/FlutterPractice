import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

class BatteryGetWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return BatteryGetWidgetState();
  }
}

class BatteryGetWidgetState extends State<BatteryGetWidget> {
  static const platform = const MethodChannel('demo.hanxiaocu/battery');

  String _batteryLever = '未知';

  Future<Null> _getBatteryLever() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '电量：$result.';
    } on PlatformException catch (e) {
      batteryLevel = 'Faild 获取电量：${e.message}';
    }
    setState(() {
      _batteryLever = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text('获取电量'),
              onPressed: _getBatteryLever,
            ),
            new Text(_batteryLever)
          ],
        ),
      ),
    );
  }
}
