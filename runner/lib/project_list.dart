import 'package:flutter/material.dart';
import 'widget/widget_demo.dart';
import 'demo/demo_list.dart';

class ProjectListWidget extends StatelessWidget {
  final List<String> items = ["widget demo", "示例"];

  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
      appBar: AppBar(title: Text("runner")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) {
          return ListTile(
              title: Text(items[position]),
              subtitle: null,
              onTap: () {
                _pushPage(context, position);
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
        page = DemoListWidget();
        break;
      default:
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
