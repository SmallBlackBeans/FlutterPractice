import 'package:flutter/material.dart';
import 'product.dart';

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
