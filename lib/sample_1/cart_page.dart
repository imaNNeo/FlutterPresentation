import 'package:flutter/material.dart';
import 'package:flutter_presentation/sample_1/model/CartItem.dart';
import 'package:flutter_presentation/sample_1/model/CartModel.dart';
import 'package:flutter_presentation/sample_1/model/Product.dart';

class CartPage extends StatelessWidget {
  CartModel cartModel;

  CartPage(this.cartModel);

  @override
  Widget build(BuildContext context) {
    Map<Product, int> products = new Map();
    cartModel.items.forEach((CartItem cartItem) {
      if (products.containsKey(cartItem.product)) {
        products[cartItem.product] = products[cartItem.product] + 1;
      } else {
        products[cartItem.product] = 1;
      }
    });

    return Scaffold(
      appBar: new AppBar(
        title: Text("Cart Items"),
      ),
      body: ListView(
        children: products.keys.map((Product product) {
          int count = products[product];
          return SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Container(
              color: product.color,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${product.name}   (\$${product.price})",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("x$count", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
