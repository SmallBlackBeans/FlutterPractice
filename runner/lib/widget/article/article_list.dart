import 'package:flutter/material.dart';
import 'article.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ArticleList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _ArticleState();
  }
}

class _ArticleState extends State<ArticleList> {
  var _items = [];
  void _reqData() async {
    String articleURL = "";
    Response response = await get(articleURL);
    final body = json.decode(response.body);
    final int resultCode = body["resultCode"];
    if (resultCode == 0) {
      var items = [];
      final arcicles = body["data"]["articleVOS"];
      arcicles.forEach((arcticle) => items.add(Article(arcticle["title"],
          arcticle["h5Url"], arcticle["articleId"], arcticle["type"])));

      setState(() {
        _items = items;
      });
    }
  }

  @override
  void initState() {
    //
    super.initState();
    _reqData();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        appBar: AppBar(title: Text("hanxiaocu")),
        body: new ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: _items.length * 2,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) {
                return Divider();
              }
              final index = position ~/ 2;
              return _buildRow(index);
            }));
  }

  Widget _buildRow(int i) {
    Article article = _items[i];
    return ListTile(
        title: Text(article.title), subtitle: Text('${article.type}'));
  }
}
