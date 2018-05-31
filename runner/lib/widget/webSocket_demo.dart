import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:english_words/english_words.dart'; //产生随机消息

class WebSoketPage extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');
  final String title = 'websocket demo';
  // WebSoketPage({Key key, @required this.channel, @required this.title})
  //     : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebSoketPageState();
  }
}

class _WebSoketPageState extends State<WebSoketPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'send a message'),
              ),
            ),
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  //上下内边距24
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: '发送消息',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.channel.sink.close();
    super.dispose();
  }
}
