import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pagos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Elige tu método de pago"),
              GestureDetector(
                onTap: _paymentSuccesful,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          child: Icon(
                        Icons.credit_card,
                        size: 60,
                      )),
                      Expanded(child: Text("Tarjeta de credito")),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: _paymentSuccesful,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              alignment: FractionalOffset.center,
                              image: NetworkImage(
                                  "https://logos-marcas.com/wp-content/uploads/2020/04/PayPal-s%C3%ADmbolo.png"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Text("Paypal")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _paymentSuccesful() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Image.network(
                "https://ak.picdn.net/shutterstock/videos/1007478907/thumb/1.jpg"),
            content: Column(
              children: [
                Text("Orden exitosa"),
                Text(
                    "Tu orden ha sido registrada para más información buca en la opcion historial de compras en tu perfil.")
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Aceptar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
