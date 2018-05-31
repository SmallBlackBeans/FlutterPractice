import 'package:flutter/material.dart';
import 'product.dart';
import 'shopping_item.dart';

class ShoppingList extends StatefulWidget {
  final List<Product> products;
  ShoppingList({this.products});
  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    //为了通知框架它改变了它的内部状态，需要调用setState
    //setState将该widget标记为”dirty”(脏的)，并且计划在下次应用程序需要更新屏幕时重新构建它
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  void didUpdateWidget(ShoppingList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //在重建list时接收到通知
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("购物列表"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        //要访问当前ShoppingList的属性，_ShoppingListState可以使用它的widget属性
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
