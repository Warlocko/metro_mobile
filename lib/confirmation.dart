import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/store.dart';

class MmConfirmationStateful extends StatefulWidget {

  final String orderID;

  MmConfirmationStateful(this.orderID);

  @override
  MmConfirmation createState() => MmConfirmation();
}

class MmConfirmation extends State<MmConfirmationStateful> {

  @override

  void initState() {
    _pedido               = widget.orderID;
  }

  String _pedido               = "sin pedido";


  Widget build(BuildContext context) {
    Map<int, Color> grayDisc = {
      50: Color.fromRGBO(54, 57, 63, .1),
      100: Color.fromRGBO(54, 57, 63, .2),
      200: Color.fromRGBO(54, 57, 63, .3),
      300: Color.fromRGBO(54, 57, 63, .4),
      400: Color.fromRGBO(54, 57, 63, .5),
      500: Color.fromRGBO(54, 57, 63, .6),
      600: Color.fromRGBO(54, 57, 63, .7),
      700: Color.fromRGBO(54, 57, 63, .8),
      800: Color.fromRGBO(54, 57, 63, .9),
      900: Color.fromRGBO(54, 57, 63, 1),
    };
    Map<int, Color> blueDisc = {
      50: Color.fromRGBO(114, 137, 218, .1),
      100: Color.fromRGBO(114, 137, 218, .2),
      200: Color.fromRGBO(114, 137, 218, .3),
      300: Color.fromRGBO(114, 137, 218, .4),
      400: Color.fromRGBO(114, 137, 218, .5),
      500: Color.fromRGBO(114, 137, 218, .6),
      600: Color.fromRGBO(114, 137, 218, .7),
      700: Color.fromRGBO(114, 137, 218, .8),
      800: Color.fromRGBO(114, 137, 218, .9),
      900: Color.fromRGBO(114, 137, 218, 1),
    };
    MaterialColor myGrey = MaterialColor(0xFF36393F, grayDisc);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                height: 750,
                color: myGrey,
                child: Column(children: <Widget>[
                  Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 32, left: 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: new IconButton(
                          icon: new Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child:
                      Text("¡Tú pedido ha sido realizado!", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),)
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 40),
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(text: "Tu compra ha sido realizada con éxito, el número de tu orden es", style: TextStyle()),
                          TextSpan(text: " #$_pedido", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: " y está siendo procesada en nuestro almacén.", style: TextStyle()),
                          TextSpan(text: "\n\n¡Mantén contacto con nosotros o regresa a la tienda a ver más de nuestros productos!.", style: TextStyle()),
                        ]
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MmStoreStateful())),
                    color: myblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 75, right: 75),
                    child: const Text('Regresar a la tienda', style: TextStyle(color: Colors.white, fontSize: 18)),
                  )
                ]))));
  }
}
