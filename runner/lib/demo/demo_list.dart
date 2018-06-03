import 'package:flutter/material.dart';
import 'AnimatedListSample.dart';
import 'AppBarBottomSample.dart';
import 'BasicAppBarSample.dart';
import 'ExpansionTileSample.dart';
import 'AppBarTabbarSample.dart';
import 'FlutterLayoutSample1.dart';
import 'PavlovaLayoutSample2.dart';

class DemoListWidget extends StatelessWidget {
  final List<String> items = const [
    "动画列表",
    "Basic AppBar",
    "AppBar bottom",
    "折叠列表",
    "TabBar选项卡",
    "布局示例1",
    "布局示例2"
  ];
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
        page = BasicAppBarSample();
        break;
      case 2:
        page = AppBarBottomSample();
        break;
      case 3:
        page = ExpansionTileSample();
        break;
      case 4:
        page = AppBarTabbarSample();
        break;
      case 5:
        page = FlutterLayoutSample1();
        break;
      case 6:
        page = PavlovaLayoutSample();
        break;

      default:
    }

    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
