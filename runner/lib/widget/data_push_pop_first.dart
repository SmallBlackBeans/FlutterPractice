import 'package:flutter/material.dart';
import 'data_push_pop_second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: new Center(
        child: SelectButton(),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Select sometion'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result =
        await Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return SecondPage();
    }));
    if (result != null) {
      Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('$result'),
          ));
    }
  }
}
