import 'package:flutter/material.dart';
import 'AnimatedListSample.dart';
import 'AppBarBottomSample.dart';

class DemoListWidget extends StatelessWidget {
  final List<String> items = const ["动画列表", "AppBar bottom"];
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
        page = AnimatedListSample();
        break;
      case 1:
        page = AppBarBottomSample();
        break;
      default:
    }

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
