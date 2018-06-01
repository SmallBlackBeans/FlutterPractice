import 'package:flutter/material.dart';
import 'Container.dart';
import 'image_demo.dart';
import 'multi_list_demo.dart';
import 'grid_list_demo.dart';
import 'delete_item_list.dart';
import 'todos_list.dart';
import 'data_push_pop_first.dart';
import 'PostList.dart';
import 'webSocket_demo.dart';
import 'shopping/product.dart';
import 'shopping/shoppingList.dart';
import 'article/RandomWords.dart';
import 'article/content_list.dart';

class WidgetDemoPage extends StatelessWidget {
  final List<String> items = [
    "图片加载",
    "item 删除",
    "Todos",
    "页面跳转与传值",
    "网络获取",
    "GridList",
    "多类型list",
    "无限列表",
    "文章列表",
    "包裹容器",
    "商品选择",
    "webSocket 连接"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("runner")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(items[index]),
              subtitle: null,
              onTap: () {
                _pushPage(context, index);
              });
        },
      ),
    );
  }

  void _pushPage(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = ImageWidget();
        break;
      case 1:
        page = DeleteItemList();
        break;
      case 2:
        page = TodoList();
        break;
      case 3:
        page = FirstPage();
        break;
      case 4:
        page = PostPage();
        break;
      case 5:
        page = GridListWidget();
        break;
      case 6:
        page = ListMulti();
        break;
      case 7:
        page = RandomWords();
        break;
      case 8:
        page = ContentList();
        break;
      case 9:
        page = ContainerWidget();
        break;
      case 10:
        page = ShoppingList(products: <Product>[
          Product(name: "鸡蛋"),
          Product(name: "火腿"),
          Product(name: "方便面")
        ]);
        break;
      case 11:
        page = WebSoketPage();
        break;
      default:
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
