import 'package:flutter/material.dart';

class FlutterWebDemo extends StatelessWidget {
  static TextStyle bold24Roboto = new TextStyle(
      color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w900);

  final gradientContainer = new Container(
    child: new Center(
      child: new Container(
        /* 
         new Text(
          'hanxiaocu'.toUpperCase(),
          style: bold24Roboto.copyWith(letterSpacing: 10.0),
        ),
         */
        child: new RichText(
          text: new TextSpan(
            style: bold24Roboto,
            children: <TextSpan>[
              TextSpan(text: 'han'),
              TextSpan(
                  text: 'xiaocu',
                  style: bold24Roboto.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 10.0))
            ],
          ),
          //摘要只显示一行 剩余...
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        //用来做一些背景色或者其他修饰
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: const Color(0xcc000000),
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 4.0),
              new BoxShadow(
                  color: const Color(0xcc000000),
                  offset: new Offset(0.0, 6.0),
                  blurRadius: 20.0)
            ],
            gradient: new LinearGradient(
              /* 
          渐变“角度”基于Alignment（x，y）值:
            如果开始和结束的x值相等，则渐变是垂直的（0°	180°）。
            如果开始和结束的y值相等，则渐变为水平（90°	270°）
           */
              begin: const Alignment(-1.0, -1.0),
              end: const Alignment(1.0, 1.0),
              colors: <Color>[const Color(0xffef5350), const Color(0x00ef5350)],
            )),
        padding: new EdgeInsets.all(16.0),
      ),
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[400],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Web demo"),
      ),
      body: new Center(
        child: gradientContainer,
      ),
    );
  }
}
