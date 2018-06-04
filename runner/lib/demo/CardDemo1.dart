import 'package:flutter/material.dart';

var card = new SizedBox(
  height: 210.0,
  child: new Card(
      child: new Column(
    children: [
      new ListTile(
        title: new Text(
          "12345",
          style: new TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: new Text('city, CA 9999'),
        leading: new Icon(
          Icons.restaurant_menu,
          color: Colors.blue[500],
        ),
      ),
      new Divider(),
      new ListTile(
        title: new Text(
          '(110)555-1212',
          style: new TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: new Icon(Icons.contact_phone, color: Colors.blue[500]),
      ),
      new ListTile(
          title: new Text('xxx@gmail.com'),
          leading: new Icon(
            Icons.contact_mail,
            color: Colors.blue[500],
          ))
    ],
  )),
);

class CardDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Card demo1"),
      ),
      body: new Center(child: card),
    );
  }
}
