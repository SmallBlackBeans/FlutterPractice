import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("选择页面"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new RaisedButton(
              child: Text("haha"),
              onPressed: () {
                Navigator.pop(context, 'haha');
              },
            ),
            new RaisedButton(
              child: Text('嗯哼'),
              onPressed: () {
                Navigator.pop(context, '嗯哼');
              },
            )
          ],
        ),
      ),
    );
  }
}
