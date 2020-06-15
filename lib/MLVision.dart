import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/confirmation.dart';
import 'Dart:math';

import './stripe/stripe_provider.dart';

class MmVisionStateful extends StatefulWidget {


  @override
  MmVision createState() => MmVision();
}




class MmVision extends State<MmVisionStateful> {
  final _formKey = GlobalKey<FormState>();




  //PARA ACTUALIZAR EN TIEMPO REAL SEGUN EL INPUT LAS VARIABLES
  final myControllerCVC = TextEditingController();
  final myControllerNumCard = TextEditingController();
  final myControllerMonEXP = TextEditingController();
  final myControllerYeaEXP = TextEditingController();


  @override
  //PARA ACTUALIZAR EN TIEMPO REAL SEGUN EL INPUT LAS VARIABLES
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myControllerCVC.dispose();
    myControllerNumCard.dispose();
    myControllerMonEXP.dispose();
    myControllerYeaEXP.dispose();
    super.dispose();
  }

  //PARA LIGAR LAS VARIABLES RECIBIDAS A LA SCREEN
  void initState() {
    super.initState();
    _monto               = soloNumeros("a"); //Recibe en 9000 <= 90,00
    _montoDetallado               = montoMoneda("b");
  }
  //MONTO LO RECIBE DE LA VENTANA ANTERIOR
  //widget.price
  String _monto               = "5000";
  String _montoDetallado               = "XXXX MXN";

  //VARIABLES PARA EL POST DE STRIPE ETC
  var _stripe                 = new Stripe();

  String _token               = 'Sin token';

  //API KEY
  String _secretKey           = 'sk_test_51Gtj5lKf7cAo5ARcqjaml25p8AVC1CXUXxjz1cIhqTw4gH42QBUgurPSgfvHxF3Xn9gNDFYqdCgJa0Z0w4TO3uvW00MofyGXG4';//<-- your secretKey



  String _concepto            = 'Pago a Metromobile ';


  @override
  DateTime now = DateTime.now();

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

    MaterialColor myGrey = MaterialColor(0xFF36393F, grayDisc);
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

                              //RECUPERA EL MONTO A PAGAR
                              Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 28,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  child: Text(
                                      'Monto a pagar: $_montoDetallado MXN'  ,
                                      style: TextStyle(color: Colors.white, fontSize: 20)
                                  )),

                              Container(
                                  margin: EdgeInsets.only(bottom: 45),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  child: TextFormField(

                                    //PARA ACTUALIZAR LAS VARIABLES EN TIEMPO REAL
                                    controller: myControllerNumCard,

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

                                    controller: myControllerMonEXP,

                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: 'Mes de Vencimiento',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Porfavor llena el campo con la información solicitada';
                                      }
                                      return null;
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.only(bottom: 45),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  child: TextFormField(

                                    controller: myControllerYeaEXP,

                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: 'Año de Vencimiento',
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

                                    controller: myControllerCVC,


                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: 'CVV',
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

                    onPressed: () {

                      //PREPARA DATOS PARA EL POST A STRIPE
                      _concepto = _concepto+now.toString();
                      _concepto = _concepto+" Monto: "+_montoDetallado+" MXN";


                      //EMPEZAR EL PAGO PEDIR UN TOKEN
                      getToken();



                    },
                    color: Colors.orange,
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 75, right: 75),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Row(
                          children: <Widget>[
                            Text('Proceder al pago '  ,
                                style: TextStyle(color: Colors.white, fontSize: 20)),
                            Icon(Icons.credit_card, color: Colors.white, size: 40)
                          ],
                        )
                    ))
              ]),
            )));



  }

  /*
  *     myControllerCVC = cvc
    myControllerNumCard = number card
    myControllerMonEXP = month expiration
    myControllerYeaEXP = year expiration
    * */

  //tarjeta: 4000 0566 5566 5556
  // cvc: 123
  // mes: 12    año:  2024


  //tarjeta: 5555 5555 5555 4444
  // cvc: 000
  // mes: 04    año:  2030

  void getToken()  {
    _stripe.cardToken(myControllerNumCard.text,myControllerYeaEXP.text,
        myControllerMonEXP.text,myControllerCVC.text,
        _secretKey).then((data){
      setState(() {

        print(data);
        if(data.contains('"error"')){
          _token = "Error en los datos de la tarjeta, favor de verificarlos";
          print("Error detectado en los datos de la tarheta por Stripe!");


          // set up the button
          Widget okButton = FlatButton(
            child: Text("OK"),
            onPressed: () {Navigator.pop(context); },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Error"),
            content: Text("Por favor verifica los datos de tu tarjeta"),
            actions: [
              okButton,
            ],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );


        }
        else {
          _token = data;
          setCharge();





        }
      });



    });
  }
  void setCharge(){
    var orderID = "";
    //GENERAR UNA ORDEN DE PEDIDO
    var rng = new Random();
    var l = new List.generate(12, (_) => rng.nextInt(9));

    for (int i = 0; i<l.length;i++){
      orderID = orderID +l[i].toString();
    }

    _concepto = _concepto+", Pedido #"+orderID;

    //usa _token para autorizar el pago
    if (_token=='Sin token'|| _token=="Error en los datos de la tarjeta, favor de verificarlos"){print('No puedes realizar pago');

    }
    else{
      _stripe.createCharge(_token,_monto,_concepto,_secretKey).then((data){
        setState(() {

          //MANDAR A LA OTRA PANTALLA
          //data seria el comprobate de pago
          confirmed(orderID);
        });

      });
    }
  }

  //PREPARA LOS DATOS PARA STRIPE
  String soloNumeros(String str){
    //$ 5,000.00 MXN
    var result = str.replaceAll(new RegExp(r'[^\w\s]+'),'');
    return result;
  }

  String montoMoneda(String str){
    var result = "PAGINA DE PRUEBA";
    return result;
  }

  void confirmed(String orderID){

    //enviar token de pago

    Navigator.push(context, MaterialPageRoute(builder: (context) => MmConfirmationStateful(orderID)));
  }
}

