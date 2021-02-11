import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import '../models/product_dessert.dart';
import '../utils/constants.dart';
import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class ItemDessert extends StatefulWidget {
  final ProductDesserts dessert;
  List<ProductItemCart> cart;

  ItemDessert({
    Key key,
    @required this.dessert,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemDessertState createState() => _ItemDessertState();
}

class _ItemDessertState extends State<ItemDessert> {
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
                Text("Postres"),
                Text("${widget.dessert.productTitle}"),
                Text("${widget.dessert.productPrice}"),
              ],
            ),
            Expanded(
              child: Container(
                child: Image.network(widget.dessert.productImage),
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
                    widget.dessert.liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.dessert.liked = !widget.dessert.liked;
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
          return DessertDetails(
            dessert: widget.dessert,
            cart: widget.cart,
          );
        },
      ),
    );
  }
}
