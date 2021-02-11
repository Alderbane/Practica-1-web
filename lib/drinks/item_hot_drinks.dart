import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

import '../utils/constants.dart';
import 'item_hot_drinks_details.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  List<ProductItemCart> cart;
  ItemHotDrinks({
    Key key,
    @required this.drink,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _openDetails,
        child: Container(
            child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: c3,
          child: Row(children: [
            Column(
              children: [
                Text(
                  "Bebidas calientes",
                  textAlign: TextAlign.left,
                ),
                Text("${widget.drink.productTitle}"),
                Text("${widget.drink.productPrice}"),
              ],
            ),
            Expanded(
              child: Container(
                child: Image.network(widget.drink.productImage),
                width: 100,
                height: 100,
              ),
              flex: 6,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 70),
                child: IconButton(
                  icon: Icon(
                    widget.drink.liked ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.drink.liked = !widget.drink.liked;
                    });
                  },
                ),
              ),
              flex: 1,
            )
          ]),
        )));
  }

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinkDetails(
            drink: widget.drink,
            cart: widget.cart,
          );
        },
      ),
    );
  }
}
