import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BasicAppBarSampleState();
  }
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0];

  void _selectChoice(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
      appBar: AppBar(
        title: Text("BasicAppBar"),
        actions: <Widget>[
          new IconButton(
            tooltip: choices[0].title,
            icon: Icon(choices[0].icon),
            onPressed: () {
              _selectChoice(choices[0]);
            },
          ),
          new IconButton(
            tooltip: choices[1].title,
            icon: Icon(choices[1].icon),
            onPressed: () {
              _selectChoice(choices[1]);
            },
          ),
          new PopupMenuButton<Choice>(
            onSelected: _selectChoice,
            itemBuilder: (context) {
              return choices.skip(2).map((Choice choice) {
                return new PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ChoiceCard(
          choice: _selectedChoice,
        ),
      ),
    ));
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        Theme.of(context).textTheme.display1; // TODO: implement build
    return new Card(
        color: Colors.white,
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
            ])));
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
