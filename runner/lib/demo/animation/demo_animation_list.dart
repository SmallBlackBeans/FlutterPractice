import 'package:flutter/material.dart';
import 'AnimatedBuilderDemo.dart';
import 'Photo_grid_list.dart';

class DemoAnimationList extends StatelessWidget {
  final List<String> items = const ["Logo动画", "图片 列表"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("动画"),
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
        page = LogoAppAnimationWidget();
        break;
      case 1:
        page = PhotoGridListDemo();
        break;
      default:
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
