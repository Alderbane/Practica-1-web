import 'package:estructura_practica_1/cart/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

import '../utils/constants.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: EdgeInsets.only(bottom: 90),
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.productsList[index],
                );
              },
            ),
          ),
          Positioned(
              left: 10,
              right: 10,
              bottom: 60,
              child: Text(
                "Total: \$$_total",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )),
          Positioned(
            // width: MediaQuery.of(context).size.width * 0.9,
            left: 20,
            right: 20,
            bottom: 10,
            child: RaisedButton(
              onPressed: _openPayment,
              color: c3,
              child: Text("Pagar"),
            ),
          )
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }

  void _openPayment() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PaymentPage();
    }));
  }
}
