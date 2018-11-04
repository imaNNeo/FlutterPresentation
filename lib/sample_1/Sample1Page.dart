import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_presentation/sample_1/model/Product.dart';

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
      'Product $index', new Random().nextInt(30), myColors[index]);
});

class Sample1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Sample 1"),
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
          )
        ],
      ),
    );
  }
}
