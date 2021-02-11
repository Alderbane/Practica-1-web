import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainList;
  List<ProductItemCart> cart;
  GrainsPage({
    Key key,
    @required this.grainList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: grainList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainList[index],
            cart: cart,
          );
        },
      ),
    );
  }
}
