import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/cart/payment.dart';
import '../utils/constants.dart';

class GrainDetails extends StatefulWidget {
  final ProductGrains grain;
  List<ProductItemCart> cart;
  GrainDetails({
    Key key,
    @required this.grain,
    @required this.cart,
  }) : super(key: key);

  @override
  _GrainDetailsState createState() => _GrainDetailsState();
}

class _GrainDetailsState extends State<GrainDetails> {
  List<ProductItemCart> productList = new List<ProductItemCart>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.grain.productTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.network(widget.grain.productImage),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: IconButton(
                    icon: Icon(
                      widget.grain.liked
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.grain.liked = !widget.grain.liked;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.grain.productTitle)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.grain.productDescription)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Tamaños Disponibles"),
                  Text("${widget.grain.productPrice}")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _changeCuarto,
                  child: Chip(
                      label: Text("250g"),
                      backgroundColor:
                          widget.grain.productWeight == ProductWeight.CUARTO
                              ? Colors.purple[100]
                              : Colors.grey[150]),
                ),
                GestureDetector(
                  onTap: _changeKilo,
                  child: Chip(
                      label: Text("1Kg"),
                      backgroundColor:
                          widget.grain.productWeight == ProductWeight.KILO
                              ? Colors.purple[100]
                              : Colors.grey[150]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      String s;
                      switch (widget.grain.productWeight) {
                        case ProductWeight.CUARTO:
                          s = "250 g";
                          break;
                        case ProductWeight.KILO:
                          s = "1 Kg";
                          break;
                        default:
                          s = "";
                      }
                      widget.cart.add(ProductItemCart(
                        productTitle: widget.grain.productTitle,
                        productAmount: 1,
                        productPrice: widget.grain.productPrice,
                        productImage: widget.grain.productImage,
                        typeOfProduct: ProductType.GRANO,
                        size: s,
                      ));
                      Navigator.of(context).pop();
                    },
                    child: Text("Agregar al carrito"),
                    color: c3,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PaymentPage();
                      }));
                    },
                    child: Text("Comprar ahora"),
                    color: c3,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changeCuarto() {
    setState(() {
      widget.grain.productWeight = ProductWeight.CUARTO;
      widget.grain.productPrice = widget.grain.productPriceCalculator();
    });
  }

  void _changeKilo() {
    setState(() {
      widget.grain.productWeight = ProductWeight.KILO;
      widget.grain.productPrice = widget.grain.productPriceCalculator();
    });
  }
}
