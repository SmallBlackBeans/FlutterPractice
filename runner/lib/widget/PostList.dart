import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

//模型
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({this.userId, this.id, this.title, this.body});

  //类方法 工厂函数
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://jsonplaceholder.typicode.com/posts/3',
      headers: {HttpHeaders.AUTHORIZATION: "token"});
  final jsonRes = json.decode(response.body);
  return Post.fromJson(jsonRes);
}

class PostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _PostPageState();
  }
}

class _PostPageState extends State<PostPage> {
  String _title = 'fetch data...';
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: new Center(
        child: new FutureBuilder<Post>(
          future: fetchPost(),
          builder: (context, snpshot) {
            if (snpshot.hasData) {
              // /_updateTitle(snpshot.data.title);
              return new Text('${snpshot.data.body}');
            } else if (snpshot.hasData) {
              return new Text("${snpshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  // void _updateTitle(String title) {
  //   setState(() {
  //     _title = title;
  //   });
  // }
}
