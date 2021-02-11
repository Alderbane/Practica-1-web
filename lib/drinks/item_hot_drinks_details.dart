import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import '../models/product_item_cart.dart';
import '../models/product_repository.dart';
import '../utils/constants.dart';
import 'package:estructura_practica_1/cart/payment.dart';

class HotDrinkDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  List<ProductItemCart> cart;
  HotDrinkDetails({
    Key key,
    @required this.drink,
    @required this.cart,
  }) : super(key: key);

  @override
  _HotDrinkDetailsState createState() => _HotDrinkDetailsState();
}

class _HotDrinkDetailsState extends State<HotDrinkDetails> {
  List<ProductItemCart> productList = new List<ProductItemCart>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.productTitle),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.network(widget.drink.productImage),
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
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
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.drink.productTitle)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.drink.productDescription)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Tamaños Disponibles"),
                Text("${widget.drink.productPrice}")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _changeChico,
                child: Chip(
                    label: Text("CH"),
                    backgroundColor: widget.drink.productSize == ProductSize.CH
                        ? Colors.purple[100]
                        : Colors.grey[150]),
              ),
              GestureDetector(
                onTap: _changeMediano,
                child: Chip(
                    label: Text("M"),
                    backgroundColor: widget.drink.productSize == ProductSize.M
                        ? Colors.purple[100]
                        : Colors.grey[150]),
              ),
              GestureDetector(
                onTap: _changeGrande,
                child: Chip(
                    label: Text("G"),
                    backgroundColor: widget.drink.productSize == ProductSize.G
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
                    switch (widget.drink.productSize) {
                      case ProductSize.CH:
                        s = "Chico";
                        break;
                      case ProductSize.M:
                        s = "Mediano";
                        break;
                      case ProductSize.G:
                        s = "Grande";
                        break;
                      default:
                        s = "";
                    }
                    widget.cart.add(ProductItemCart(
                      productTitle: widget.drink.productTitle,
                      productAmount: 1,
                      productPrice: widget.drink.productPrice,
                      productImage: widget.drink.productImage,
                      typeOfProduct: ProductType.BEBIDAS,
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
    );
  }

  void _changeChico() {
    setState(() {
      widget.drink.productSize = ProductSize.CH;
      widget.drink.productPrice = widget.drink.productPriceCalculator();
    });
  }

  void _changeMediano() {
    setState(() {
      widget.drink.productSize = ProductSize.M;
      widget.drink.productPrice = widget.drink.productPriceCalculator();
    });
  }

  void _changeGrande() {
    setState(() {
      widget.drink.productSize = ProductSize.G;
      widget.drink.productPrice = widget.drink.productPriceCalculator();
    });
  }
}
