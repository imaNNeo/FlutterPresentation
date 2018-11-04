import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_presentation/sample_1/model/CartModel.dart';
import 'package:flutter_presentation/sample_1/model/Product.dart';
import 'package:scoped_model/scoped_model.dart';

final myColors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.cyan,
  Colors.deepOrange,
  Colors.brown,
  Colors.yellow,
  Colors.pinkAccent,
  Colors.teal,
  Colors.purpleAccent,
  Colors.pink,
  Colors.blueGrey,
  Colors.purple
];

final List<Product> products = List.generate(14, (index) {
  return new Product(
      'Product ${index + 1}', new Random().nextInt(30), myColors[index]);
});

class Sample1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CartModel(),
      child: Scaffold(
        appBar: new AppBar(
          title: ScopedModelDescendant(builder: (context, _, CartModel cartModel) {
            return Text("${cartModel.itemCount} items in cart");
          }),
          actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})],
        ),
        body: GridView.count(
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 2,
          children: List.generate(products.length, (index) {
            Product product = products[index];
            return productWidget(product);
          }),
        ),
      ),
    );
  }

  Widget productWidget(Product product) {
    return new Container(
      color: product.color,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              product.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 40.0,
              child: Container(
                color: Colors.black12,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                          child: Text(
                        '${product.price} \$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      )),
                    ),
                    Material(
                      child: ScopedModelDescendant(
                        builder: (context, _, CartModel cartModel) {
                          return IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                cartModel.add(product);
                              });
                        },
                        rebuildOnChange: false,
                      ),
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
