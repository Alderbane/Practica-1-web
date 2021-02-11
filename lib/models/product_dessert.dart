import 'dart:math';
import 'package:flutter/foundation.dart';

class ProductDesserts {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  double productPrice; // precio del producto autocalculado
  int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDesserts({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }

  // Mandar llamar este metodo cuando se cambie el tamanio del producto
  // De esta manera el precio del nuevo tamanio del producto se autocalcula
  // Por ejemplo cuando se cambie a M
  //
  // FlatButton(
  //   child: Text("M"),
  //   onPressed: () {
  //     setState(() {
  //       prod.productSize = ProductSize.M;
  //       prod.productPrice = prods.productPriceCalculator();
  //     });
  //   },
  // ),
  //
  //
  double productPriceCalculator() {
    return (40 + Random().nextInt(60)).toDouble();
  }
}
