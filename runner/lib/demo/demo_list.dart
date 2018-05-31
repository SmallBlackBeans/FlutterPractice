import 'package:flutter/material.dart';
import 'shopping/product.dart';
import 'shopping/shoppingList.dart';
import 'article/content_list.dart';
import 'article/RandomWords.dart';
import 'package:runner/widget/widget_demo.dart';

class DemoListWidget extends StatelessWidget {
  final List<String> items = ["widget demo", "实例"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("示例"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(items[index]),
              subtitle: Text(''),
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
