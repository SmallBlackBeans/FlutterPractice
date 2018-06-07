import 'package:flutter/material.dart';
import 'Todo.dart';
import 'Todo_detail.dart';

final todos = new List<Todo>.generate(20, (i) {
  return Todo(title: 'Todo $i', description: 'A description of Todo $i');
});

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Todos list"),
      ),
      body: new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TodoDetail(
                  todo: null,
                );
              }));
            },
          );
        },
      ),
    );
  }
}
