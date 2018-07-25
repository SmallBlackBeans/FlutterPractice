import 'package:flutter/material.dart';

import 'demo/demo_list.dart';
import 'widget/widget_demo.dart';

class ProjectListWidget extends StatelessWidget {
  final List<String> items = ["widget demo", "示例"];

  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text("runner"),
//        leading: new Icon(Icons.account_circle),
      ),
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
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
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
            new ListTile(
              leading: new Icon(Icons.refresh),
              title: new Text("刷新"),
            ),
            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text("帮助"),
            ),
            new ListTile(
              leading: new Icon(Icons.chat),
              title: new Text("会话"),
            ),
            new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text("设置"),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: new SimpleDialog(
                contentPadding: const EdgeInsets.all(10.0),
                title: new Text("我是标题"),
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.apps),
                    title: new Text("apps"),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.android),
                    title: new Text("andrpid"),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.cake),
                    title: new Text("cake"),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("cofe"),
                  ),
                ],
              ));
        },
        child: new Icon(Icons.add),
        backgroundColor: Colors.red,
        elevation: 10.0,
        highlightElevation: 15.0,
      ),
      //底部持久化显示按钮
      persistentFooterButtons: <Widget>[
        new Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                        child: new Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.chat),
                                  title: new Text("开始会话"),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.help),
                                  title: new Text("操作说明"),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.settings),
                                  title: new Text("系统设置"),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.more),
                                  title: new Text("更多设置"),
                                ),
                              ],
                            )));
                  });
            },
            child: new Icon(Icons.android),
          );
        }),
        new Icon(Icons.book),
        new Icon(Icons.hourglass_empty),
        new Icon(Icons.headset),
        new Icon(Icons.home),
        new Icon(Icons.help)
      ],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart), title: new Text("首页")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text("商城")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("我的")),
        ],
        fixedColor: Colors.red,
        currentIndex: 0,
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
