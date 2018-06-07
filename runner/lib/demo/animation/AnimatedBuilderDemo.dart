import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return new Container(
      //垂直对称 上下外间距10
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class LogoAppAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _LogoAppAnimationState();
  }
}

//SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值
//vsync 防止屏幕外动画
class _LogoAppAnimationState extends State<LogoAppAnimationWidget>
    with TickerProviderStateMixin { // ignore: mixin_inherits_from_not_object
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    //
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //动画曲线
    //final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //补间动画
    // animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //重复执行
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    // ..前面的方法表示这个方法的结果是下个方法的调用者
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //
    return
        /* 
     GrowTransition(
      child: new LogoWidget(),
      animation: animation,
    );
     */
        AnimatedLogo(
      animation: animation,
    );
  }

  @override
  void dispose() {
    //
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  GrowTransition({this.child, this.animation});
  @override
  Widget build(BuildContext context) {
    //
    return new Center(
      child: new AnimatedBuilder(
          child: child,
          animation: animation,
          builder: (context, child) {
            return new Container(
              child: child,
              width: animation.value,
              height: animation.value,
            );
          }),
    );
  }
}

//////////////////////// 并行动画//////////////////////
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  static final _opacityTween = Tween(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween(begin: 0.0, end: 300.0);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}
