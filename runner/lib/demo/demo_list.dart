import 'package:flutter/material.dart';

class DemoListWidget extends StatelessWidget {
  final List<String> items = [""];
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
        break;
      default:
    }

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
