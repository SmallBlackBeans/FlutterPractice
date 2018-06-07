import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpJsonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpJsonDemoState();
  }
}

class _HttpJsonDemoState extends State<HttpJsonDemo> {
  var _ipAddress = 'UnKnown';

  _getIpAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    setState(() {
      _ipAddress = "获取中...";
    });

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonStr = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonStr);
        result = data['origin'];
      } else {
        result =
            'Error getting Ip address:\nhttp status ${response.statusCode}';
      }
    } catch (e) {
      result = 'Failed getting IP Address';
    }

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(
      height: 32.0,
    );
    //
    return new Scaffold(
      appBar: AppBar(
        title: new Text('获取IP 地址'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('你的IP地址是'),
            new Text('$_ipAddress'),
            spacer,
            new RaisedButton(
              child: new Text('获取IP 地址'),
              onPressed: _getIpAddress,
            )
          ],
        ),
      ),
    );
  }
}
