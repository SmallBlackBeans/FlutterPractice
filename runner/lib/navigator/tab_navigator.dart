import 'package:flutter/material.dart';
import 'package:runner/navigator/left_drawer.dart';
import 'package:runner/pages/home/home_index.dart';
import 'package:runner/pages/mine/mine_index.dart';
import 'package:runner/pages/search/search_index.dart';
import 'package:runner/pages/travel/travel_index.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);

  final Color _defaultColor = Colors.grey;
  final Color _activityColor = Colors.blue;
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      body: PageView(
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MinePage()],
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _activityColor),
            title: Text("首页",
                style: TextStyle(
                    color:
                        _currentIndex != 0 ? _defaultColor : _activityColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _defaultColor),
            activeIcon: Icon(
              Icons.search,
              color: _activityColor,
            ),
            title: Text("搜索",
                style: TextStyle(
                    color:
                        _currentIndex != 1 ? _defaultColor : _activityColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: _defaultColor),
            activeIcon: Icon(
              Icons.camera,
              color: _activityColor,
            ),
            title: Text("旅拍",
                style: TextStyle(
                    color:
                        _currentIndex != 2 ? _defaultColor : _activityColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _defaultColor),
            activeIcon: Icon(
              Icons.account_circle,
              color: _activityColor,
            ),
            title: Text("我的",
                style: TextStyle(
                    color:
                        _currentIndex != 3 ? _defaultColor : _activityColor)),
          ),
        ],
      ),
      drawer: new Drawer(child: LeftDrawer()),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
        child: new Icon(Icons.ac_unit),
      ),
    );
  }
}
