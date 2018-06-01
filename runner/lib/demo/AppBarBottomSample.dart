import 'package:flutter/material.dart';

class AppBarBottomSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppBarBottomSampleSate();
  }
}

class _AppBarBottomSampleSate extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //同步 SingleTickerProviderStateMixin
    _tabController = new TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _changePage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex > _tabController.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Bottom Widget'),
        leading: IconButton(
          tooltip: '上一页',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _changePage(-1);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: "下一页",
            onPressed: () {
              _changePage(1);
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: new Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: new Container(
              height: 48.0,
              alignment: Alignment.center,
              child: new TabPageSelector(
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: List.from(
            //这里按照官方例子一直报错
            choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(
                  choice: choice,
                ),
              );
            }),
          )),
    ));
  }
}

//每一页
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            new Text(
              choice.title,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}

//数据源
const List<Choice> choices = const <Choice>[
  const Choice(title: '小汽车', icon: Icons.directions_car),
  const Choice(title: '自行车', icon: Icons.directions_bike),
  const Choice(title: '船', icon: Icons.directions_boat),
  const Choice(title: '巴士', icon: Icons.directions_bus),
  const Choice(title: '火车', icon: Icons.directions_railway),
  const Choice(title: '步行', icon: Icons.directions_walk)
];

//数据模型
class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}
