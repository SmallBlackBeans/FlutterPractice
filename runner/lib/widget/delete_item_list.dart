import 'package:flutter/material.dart';

class DeleteItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeleteItemState();
  }
}

class _DeleteItemState extends State<DeleteItemList> {
  final List<String> items = List.generate(20, (i) {
    return "Item $i";
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("可删除列表"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.remove(item);
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("$item dismissed"),
                  ));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }
}
