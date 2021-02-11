import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  List<ProductItemCart> cart;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemHotDrinks(
            drink: drinksList[index],
            cart: cart,
          );
        },
      ),
    );
  }
}
