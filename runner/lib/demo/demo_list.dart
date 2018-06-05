import 'package:flutter/material.dart';
import 'AnimatedListSample.dart';
import 'AppBarBottomSample.dart';
import 'BasicAppBarSample.dart';
import 'ExpansionTileSample.dart';
import 'AppBarTabbarSample.dart';
import 'FlutterLayoutSample1.dart';
import 'PavlovaLayoutSample2.dart';
import 'GridViewLayout.dart';
import 'ColorsList.dart';
import 'CardDemo1.dart';
import 'FlutterWebDemo.dart';
import 'FlutterAndroid.dart';
import 'SignaturePainter.dart';
import 'multiThread.dart';

class DemoListWidget extends StatelessWidget {
  final List<String> items = const [
    "动画列表",
    "Basic AppBar",
    "AppBar bottom",
    "折叠列表",
    "TabBar选项卡",
    "布局示例1",
    "布局示例2",
    "Grid Layout",
    "调色板",
    "Card 卡片",
    "Flutter到Web",
    "Flutter到安卓",
    "画板",
    "多线程"
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
      case 7:
        page = GridViewLayout();
        break;
      case 8:
        page = ColorListDemo();
        break;
      case 9:
        page = CardDemo1();
        break;
      case 10:
        page = FlutterWebDemo();
        break;
      case 11:
        page = FlutterAndroidDemo();
        break;
      case 12:
        page = PaintDemo();
        break;
      case 13:
        page = MultiThreadDemo();
        break;

      default:
    }

/* 
  在跟视图中也可以这样配置
   routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => new MyPage(title: 'page A'),
      '/b': (BuildContext context) => new MyPage(title: 'page B'),
      '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
 */
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
