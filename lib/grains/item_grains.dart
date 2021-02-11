import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import '../utils/constants.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  List<ProductItemCart> cart;
  ItemGrains({
    Key key,
    @required this.grain,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                Text("Granos"),
                Text("${widget.grain.productTitle}"),
                Text("${widget.grain.productPrice}"),
              ],
            ),
            Expanded(
              child: Container(
                child: Image.network(widget.grain.productImage),
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
                    widget.grain.liked ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.grain.liked = !widget.grain.liked;
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
          return GrainDetails(
            grain: widget.grain,
            cart: widget.cart,
          );
        },
      ),
    );
  }
}
