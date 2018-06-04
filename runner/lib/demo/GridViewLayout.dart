import 'package:flutter/material.dart';

List<Container> _buildGridTileList(int count) {
  return new List<Container>.generate(
      count,
      (int index) => new Container(
            child: new Image.asset('images/pic${index+1}.jpg'),
          ));
}

Widget buildGrid() {
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}

class GridViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: new Center(child: buildGrid()));
  }
}
