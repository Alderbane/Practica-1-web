import 'package:estructura_practica_1/cart/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import '../models/product_repository.dart';
import '../utils/constants.dart';

class DessertDetails extends StatefulWidget {
  final ProductDesserts dessert;
  List<ProductItemCart> cart;
  DessertDetails({
    Key key,
    @required this.dessert,
    @required this.cart,
  }) : super(key: key);

  @override
  _DessertDetailsState createState() => _DessertDetailsState();
}

class _DessertDetailsState extends State<DessertDetails> {
  List<ProductItemCart> productList = new List<ProductItemCart>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dessert.productTitle),
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
                    child: Image.network(widget.dessert.productImage),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.dessert.productTitle)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.dessert.productDescription)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(""), Text("${widget.dessert.productPrice}")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      widget.cart.add(ProductItemCart(
                        productTitle: widget.dessert.productTitle,
                        productAmount: 1,
                        productPrice: widget.dessert.productPrice,
                        productImage: widget.dessert.productImage,
                        typeOfProduct: ProductType.POSTRES,
                        size: "",
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
}
