import 'package:flutter/material.dart';

class GridListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("Grid 列表"),
        ),
        body: new GridView.count(
          crossAxisCount: 2,
          children: new List.generate(100, (i) {
            return Center(
              child: Text(
                'Item $i',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ));
  }
}
