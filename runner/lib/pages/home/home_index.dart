import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:runner/dao/home_dao.dart';
import 'package:runner/model/common_model.dart';
import 'package:runner/model/grid_nav_model.dart';
import 'package:runner/model/sales_box_model.dart';
import 'package:runner/pages/search/search_index.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = "景点 酒店 美食 打豆豆";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;

  bool _loading = true;


  double _appBarAlpha = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          //移除 顶端的 刘海 边距影响
          removeTop: true,
          context: context,
          child: RefreshIndicator(
              child: NotificationListener(
                  onNotification: (scrollNotification) {
                    // scrollNotification.depth == 0 第一个元素ListView 排除 Swiper元素影响
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 180,
                        child: Swiper(
                          itemCount: bannerList.length,
                          autoplay: true,
                          itemBuilder: (context, index) {
                            return Image.network(
                              bannerList[index].url,
                              fit: BoxFit.fill,
                            );
                          },
                          pagination: SwiperPagination(),
                        ),
                      ),
                      Container(
                          height: 800,
                          child: ListTile(
                            title: Text("韩小醋"),
                          ))
                    ],
                  )),
              onRefresh: _handleRefresh),
        ),
        Opacity(
          opacity: _appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(0.0, 0.5),
                    blurRadius: 0.0),
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 34),
                child: Text("首页"),
              ),
            ),
          ),
        )
      ],
    ));
  }


  Widget get _listView {
    return ListView(
      children: <Widget>[

      ],
    );
  }


  Widget get _appBar {
    return null;
  }


  _jumpToSearch() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return SearchPage(
        hint: SEARCH_BAR_DEFAULT_TEXT,
      );
    }));
  }

  void _onScroll(double offset) {
    print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0.0) {
      alpha = 0.0;
    } else if (alpha > 1.0) {
      alpha = 1.0;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  Future<Null> _handleRefresh() async {
    try {
      var model = await HomeDao.fetch();
      setState(() {
            localNavList = model.localNavList;
            subNavList = model.subNavList;
            gridNavModel = model.gridNav;
            salesBoxModel = model.salesBox;
            bannerList = model.bannerList;
            _loading = false;
          });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }
}
