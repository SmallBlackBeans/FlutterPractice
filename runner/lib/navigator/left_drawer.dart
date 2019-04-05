import 'package:flutter/material.dart';
import 'package:runner/demo/demo_list.dart';
import 'package:runner/widget/widget_demo.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      padding: const EdgeInsets.all(0.0),
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                    "http://t2.hddhhn.com/uploads/tu/201612/98/st93.png"),
              ),
            ),
            accountName: new Text("SmallBlackBeans"),
            accountEmail: new Text("mrtmaidou@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://avatars2.githubusercontent.com/u/8185813?s=460&v=4"),
            )),
        ListTile(
            leading: new Icon(Icons.book),
            title: new Text("widget demo"),
            onTap: () {
              _pushPage(context, 0);
            }),
        ListTile(
            leading: new Icon(Icons.developer_mode),
            title: new Text("示例"),
            onTap: () {
              _pushPage(context, 1);
            }),
        new ListTile(
          leading: new Icon(Icons.settings),
          title: new Text("设置"),
        ),
      ],
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
