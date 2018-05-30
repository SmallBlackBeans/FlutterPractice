import 'package:flutter/material.dart';
import '../const/strings.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/feed.dart';

class ContentList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContentListState();
  }
}

class _ContentListState extends State<ContentList> {
  var _items = []; //如果属性/方法名是以_开头，则表示这个属性/方法是类私有的

  //加载数据
  void _loadData() async {
    print("开始获取数据");
    String dataURL =
        "https://app.kangzubin.com/iostips/api/feed/list?page=1&from=flutter-app&version=1.0";
    Response response = await get(dataURL);
    print("获取数据结束");
    debugPrint("nnn");
    print(response);
    final body = json.decode(response.body);
    final int code = body["code"];
    if (code == 0) {
      final feeds = body["data"]["feeds"];
      var items = [];
      feeds.forEach((item) =>
          items.add(Feed(item["author"], item["title"], item["postdate"])));
      //在状态改变时，触发界面重新渲染，则需要调用 setState() 方法来设置我们的属性值。
      setState(() {
        _items = items;
      });
    }
  }

  //合适的时机调用获取数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("lalalala");
    _loadData();
  }

  //构建单元格
  Widget _buildRow(int i) {
    Feed feed = _items[i];
    return ListTile(
      title: Text(feed.title, overflow: TextOverflow.fade),
      subtitle: Text('${feed.postdate} @${feed.author}'),
    );
  }

  //这个方法在 Widget 被渲染到屏幕上时会调用
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Scaffold 类是 Material Design Widgets 的容器。它通常作为 Widget 层级的根
    return Scaffold(
        appBar: AppBar(title: Text(Strings.appTitle)),
        body: new ListView.builder(
          padding: const EdgeInsets.all(13.0),
          itemCount: _items.length * 2,
          itemBuilder: (BuildContext content, int position) {
            //添加分割线
            if (position.isOdd) {
              return Divider();
            }
            final index = position ~/ 2;
            return _buildRow(index);
          },
        ));
  }
}
