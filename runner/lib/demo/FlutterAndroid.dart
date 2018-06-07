import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterAndroidDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return FadeText();
  }
}

//通信
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);
  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = "get data....";
  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Center(child: new Text(dataShared)));
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}

//渐隐动画
class FadeText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _FadeTextState();
  }
}

// ignore: mixin_inherits_from_not_object
class _FadeTextState extends State<FadeText> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve; //曲线函数
  @override
  void initState() {
    //
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
      appBar: AppBar(
        title: Text('安卓通信'),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: curve,
            child: new FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
