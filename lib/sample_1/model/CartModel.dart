import 'package:flutter_presentation/sample_1/model/Cart.dart';
import 'package:flutter_presentation/sample_1/model/CartItem.dart';
import 'package:flutter_presentation/sample_1/model/Product.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model{
  final _cart = new Cart();

  List<CartItem> get items => _cart.items;
  int get itemCount => _cart.itemsCount;

  void add(Product product) {
    _cart.add(product);
    notifyListeners();
  }
}