import 'package:flutter/material.dart';

/* 
事件流是“向上”传递的，而状态流是“向下”传递的 
类似于React/Vue中父子组件通信的方式：子widget到父widget是通过事件通信，而父到子是通过状态
*/

//显示计数器
class CounterDisplay extends StatelessWidget {
  final int count;
  CounterDisplay({this.count});
  @override
  Widget build(BuildContext context) {
    return Text('count:$count');
  }
}

//更改计数器
class CounterIncrement extends StatelessWidget {
  final VoidCallback onPressed;
  CounterIncrement({this.onPressed});

  @override
  Widget build(BuildContext context) {
    //
    return new RaisedButton(
      onPressed: this.onPressed,
      child: new Text("Increment"),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _CounterState();
  }
}

//管理计数器
class _CounterState extends State<Counter> {
  var _counter = 0;
  void _onPress() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    return new Row(
      children: <Widget>[
        new CounterDisplay(
          count: _counter,
        ),
        new CounterIncrement(
          onPressed: _onPress,
        )
      ],
    );
  }
}
