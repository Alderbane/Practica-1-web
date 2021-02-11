import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';

class ProductCart {
  List<ProductHotDrinks> drinks;
  List<ProductGrains> grains;
  List<ProductDesserts> desserts;
  ProductCart({
    this.drinks,
    this.grains,
    this.desserts,
  });
}
