import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/confirmation.dart';

class MmPurchaseStateful extends StatefulWidget {
  @override
  MmPurchase createState() => MmPurchase();
}

class MmPurchase extends State<MmPurchaseStateful> {
  final _formKey = GlobalKey<FormState>();

  @override
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
      height: 770,
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
            child: Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
                padding: EdgeInsets.only(top: 30, bottom: 30),
                margin: EdgeInsets.only(bottom: 30),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 45),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor: Colors.black.withOpacity(0.5),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Número de la Tarjeta',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Porfavor llena el campo con la información solicitada';
                              }
                              return null;
                            },
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          margin: EdgeInsets.only(bottom: 45),
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor: Colors.black.withOpacity(0.5),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Fecha de Vencimiento',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Porfavor llena el campo con la información solicitada';
                              }
                              return null;
                            },
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              fillColor: Colors.black.withOpacity(0.5),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Codigo de Seguridad',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Porfavor llena el campo con la información solicitada';
                              }
                              return null;
                            },
                          )),
                    ])))),
        RaisedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MmConfirmationStateful())),
            color: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 75, right: 75),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
                child: Row(
                  children: <Widget>[
                    const Text('Hacer Pedido',
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                    Icon(Icons.credit_card, color: Colors.white, size: 40)
                  ],
                )
            ))
      ]),
    )));
  }
}
