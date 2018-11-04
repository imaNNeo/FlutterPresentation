import 'package:flutter_presentation/sample_1/model/CartItem.dart';
import 'package:flutter_presentation/sample_1/model/Product.dart';

class Cart {

  List<CartItem> items = new List();
  int get itemsCount => items.length;

  void add(Product product) {
    this.items.add(new CartItem(product));
  }

}