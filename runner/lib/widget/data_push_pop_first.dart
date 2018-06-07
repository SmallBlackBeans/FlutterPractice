import 'package:flutter/material.dart';
import 'data_push_pop_second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
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
    //
    return new RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Select sometion'),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    //等待第二个页面的数据 类似于回调 或者 startActivityForResult
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
