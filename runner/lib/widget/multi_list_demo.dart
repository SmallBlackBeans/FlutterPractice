import 'package:flutter/material.dart';

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;
  HeadingItem({this.heading});
}

class MessageItem extends ListItem {
  final String sender;
  final String body;
  MessageItem({this.sender, this.body});
}

class ListMulti extends StatelessWidget {
  final List<ListItem> _items = new List<ListItem>.generate(
      100,
      (i) => i % 6 == 0
          ? new HeadingItem(heading: 'head $i')
          : MessageItem(sender: 'sender$i', body: 'body $i'));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("多条目列表")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          }
        },
      ),
    );
  }
}
