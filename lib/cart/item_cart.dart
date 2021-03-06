import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Image.network(widget.product.productImage),
              flex: 3,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(widget.product.productTitle),
                  Text(widget.product.size),
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: _addProd,
                        ),
                      ),
                      Expanded(
                        child: Text("${widget.product.productAmount}"),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: _remProd,
                        ),
                      ),
                      Expanded(
                        child: Text("${widget.product.productPrice}"),
                        flex: 2,
                      )
                    ],
                  )
                ],
              ),
              flex: 6,
            ),

            // Column(
            //   children: <Widget>[
            //     SizedBox(
            //       height: 12,
            //     ),
            //     Text("${widget.product.productTitle}"),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     IconButton(
            //         icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     IconButton(
            //         icon: Icon(Icons.remove_circle), onPressed: _remProd),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     Text("${widget.product.productAmount}"),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     Text("${widget.product.productPrice}"),
            //     SizedBox(
            //       height: 12,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if (widget.product.productAmount == 0) {
      return;
    }
    setState(() {
      --widget.product.productAmount;
    });

    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
