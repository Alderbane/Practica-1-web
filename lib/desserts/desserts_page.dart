import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertList;
  List<ProductItemCart> cart;
  DessertsPage({
    Key key,
    @required this.dessertList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDessert(
            dessert: dessertList[index],
            cart: cart,
          );
        },
      ),
    );
  }
}
