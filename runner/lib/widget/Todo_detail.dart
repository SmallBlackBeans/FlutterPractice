import 'package:flutter/material.dart';
import 'Todo.dart';

class TodoDetail extends StatelessWidget {
  final Todo todo;
  //必须有this.todo
  TodoDetail({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
