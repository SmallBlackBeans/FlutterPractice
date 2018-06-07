import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget title;
  ScaffoldWidget({this.title});

  @override
  Widget build(BuildContext context) {
    //
    return new Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(color: Colors.blue[500]),
        child: new Row(children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "nav menu",
            onPressed: null,
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ]));
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
      appBar: AppBar(title: Text("nihao")),
      body: new Material(
        child: new Column(
          children: <Widget>[
            new ScaffoldWidget(
                title: Text(
              "Title",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.title,
            )),
            new Expanded(
              child: Center(
                child: new Text("Hello hanxiaocu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
