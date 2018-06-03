import 'package:flutter/material.dart';

class AppBarTabbarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: DefaultTabController(
            length: choices.length,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Tabbar 指示器"),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: choices.map((choice) {
                      return new Tab(
                        text: choice.title,
                        icon: Icon(choice.icon),
                      );
                    }).toList(),
                  ),
                ),
                body: new TabBarView(
                    children: choices.map((choice) {
                  return new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ChoiceCard(
                      choice: choice,
                    ),
                  );
                }).toList()))));
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  ChoiceCard({this.choice});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
        color: Colors.white,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(choice.icon, size: 128.0, color: textStyle.color),
              new Text(
                choice.title,
                style: textStyle,
              )
            ],
          ),
        ));
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: "汽车", icon: Icons.directions_car),
  const Choice(title: "步行", icon: Icons.directions_walk),
  const Choice(title: "自行车", icon: Icons.directions_bike),
  const Choice(title: "船", icon: Icons.directions_boat),
  const Choice(title: "巴士", icon: Icons.directions_bus),
  const Choice(title: "火车", icon: Icons.directions_railway),
];
