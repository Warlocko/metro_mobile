import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/contactUs.dart';
import 'package:metromobile/navbar.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
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
      100: Color.fromRGBO(114, 137, 218,.2),
      200: Color.fromRGBO(114, 137, 218, .3),
      300: Color.fromRGBO(114, 137, 218, .4),
      400: Color.fromRGBO(114, 137, 218, .5),
      500: Color.fromRGBO(114, 137, 218, .6),
      600: Color.fromRGBO(114, 137, 218, .7),
      700: Color.fromRGBO(114, 137, 218, .8),
      800: Color.fromRGBO(114, 137, 218, .9),
      900: Color.fromRGBO(114, 137, 218, 1),
    };
    MaterialColor myColor = MaterialColor(0xFF36393F, color);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);
    return Scaffold(
      backgroundColor: myColor,
        body: SingleChildScrollView(
            child:
            Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 32, left: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => MmNavbarStateful()));
                        },
                      ),
                    )),
            Container(
            width: double.infinity,
              height: 500,
              color: myColor,
              padding: EdgeInsets.only(top: 10, left: 16),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                  "Sobre nosotros...",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, height: 1.5)

                    ),
                  ),
                  Container(

                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(text: 'Metro Mobile', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' es una aplicación de ventas creada para la empresa ', style: TextStyle()),
                          TextSpan(text: 'Impulsora de Comercio Exterior Metrópoli,  S.A de C.V.  ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'ubicada en Avenida Tezozomoc 158, 02480 Azcapotzalco, CDMX México. ', style: TextStyle()),
                          TextSpan(text: '\n\nDicha empresa se encarga de la venta de equipo, bombas, válvulas, refaccionamiento, placa de acero al carbón, tubería, conexiones, accesorios, etc. \n\n Jesús Gil Ramirez', style: TextStyle()),
                          TextSpan(text: ' \n\nTeléfono: 55 3892 6499', style: TextStyle(fontWeight: FontWeight.bold)),
                        ]
                      ),
                    ),
                  )
                
                ],
              )
            ),
                    Container(
                        width: double.infinity,
                        height: 175,
                        margin: EdgeInsets.only(left: 0),
                        color: myColor,
                        child: Image.asset("assets/logo.png")
                    ),
               Container(
                 margin: EdgeInsets.only(bottom: 30),
                 child: SizedBox(
                   height: 70,
                   width: 320,
                   child: RaisedButton(
                     color: myblue,
                     onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs())),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12)
                     ),
                     padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                     child: const Text('Contáctanos' , style: TextStyle(color: Colors.white,fontSize: 26)),
                   ),
                 )
               ),
              ],
            )
        ),
    );
  }
}
