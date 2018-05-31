import 'package:flutter/material.dart';
import 'Container.dart';
import 'image_demo.dart';
import 'multi_list_demo.dart';
import 'grid_list_demo.dart';
import 'delete_item_list.dart';
import 'todos_list.dart';
import 'data_push_pop_first.dart';
import 'PostList.dart';
import 'webSocket_demo.dart';

class WidgetDemoPage extends StatelessWidget {
  final List<String> items = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("runner")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(items[index]),
              subtitle: null,
              onTap: () {
                _pushPage(context, index);
              });
        },
      ),
    );
  }

  void _pushPage(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = WidgetDemoPage();
        break;
      case 1:
        break;
      default:
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
