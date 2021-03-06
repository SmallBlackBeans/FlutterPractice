import 'package:flutter/material.dart';

class TextEditingControllerDemo extends StatefulWidget {
  TextEditingControllerDemo({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextEditingControllerDemoState();
  }
}

class _TextEditingControllerDemoState extends State<TextEditingControllerDemo> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(hintText: 'Type somethion'),
        ),
        new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return new AlertDialog(
                      title: new Text('你说啥'),
                      content: new Text(_controller.text),
                    );
                  });
            },
            child: new Text('Alert')),
      ],
    );
  }
}
