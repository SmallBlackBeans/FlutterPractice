import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 40;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red,
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class FlutterLayoutSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = _buildTitleSection(context);
    Widget buttonSection = _buildButtonSection(context);
    Widget textSection = _buildTextSection(context, null);
    Widget imageSection = _buildImageSection(context);

    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("布局示例1"),
        ),
        body: new ListView(
          children: <Widget>[
            imageSection,
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}

Widget _buildImageSection(BuildContext context) {
  return new Image.asset(
    'images/lake.jpg',
    width: 600.0,
    height: 240.0,
    fit: BoxFit.cover,
  );
}

//
Widget _buildTextSection(BuildContext context, String text) {
  return new Container(
    padding: const EdgeInsets.all(32.0),
    child: new Text(
      '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
      softWrap: true,
    ),
  );
}

Widget _buildButtonSection(BuildContext context) {
  return new Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonIcon(context, Icons.call, "打电话"),
        _buildButtonIcon(context, Icons.near_me, "附近"),
        _buildButtonIcon(context, Icons.share, "分享")
      ],
    ),
  );
}

Column _buildButtonIcon(BuildContext context, IconData icon, String label) {
  Color primaryColor = Theme.of(context).primaryColor;
  return Column(
    mainAxisSize: MainAxisSize.min,
    //主轴居中 就是垂直方向
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        color: primaryColor,
      ),
      new Container(
          child: new Text(
        label,
        style: new TextStyle(
          color: primaryColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ))
    ],
  );
}

Widget _buildTitleSection(BuildContext context) {
  return new Container(
    padding: const EdgeInsets.all(32.0),
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Column(
            //左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "我是标题",
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                "我是副标题",
                style: new TextStyle(fontSize: 14.0, color: Colors.grey[500]),
              )
            ],
          ),
        ),
        new FavoriteWidget()
      ],
    ),
  );
}
