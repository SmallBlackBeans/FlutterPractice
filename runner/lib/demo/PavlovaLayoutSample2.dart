import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PavlovaLayoutSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var titleText = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text(
        "标题",
        style: new TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30.0,
        ),
      ),
    );

    var subTitle = new Text(
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
''',
      textAlign: TextAlign.center,
      style: new TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
      ),
    );

    var ratings = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            //就是尽量拥抱紧凑在一起
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
            ],
          ),
          new Text(
            "100人 查看",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  new Text("PREP:"),
                  new Text("25min")
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.timer,
                    color: Colors.green[500],
                  ),
                  new Text("COOK:"),
                  new Text("1 hr")
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  new Text("FEEDS:"),
                  new Text("4-6 hr")
                ],
              )
            ],
          ),
        ));

    var leftColumn = new Container(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
      child: new Column(
        children: <Widget>[titleText, subTitle, ratings, iconList],
      ),
    );

    var mainImage = new CachedNetworkImage(
      alignment: Alignment.center,
      placeholder: CircularProgressIndicator(),
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/06/20/23/50/mixed-berries-1470226_1280.jpg',
    );

    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Pavlova layout"),
            ),
            body: new ListView(
              children: <Widget>[
                new Center(
                  child: new Container(
                    margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
                    child: new Card(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Container(
                            width: 440.0,
                            child: leftColumn,
                          ),
                          mainImage,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
