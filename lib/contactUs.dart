import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/aboutUs.dart';

//DEBE DE SER STATEFUL WIDGET!!!


class ContactUs extends StatelessWidget {
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
              height: 815,
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
                        padding: EdgeInsets.only(top: 20, bottom: 30),
                        margin: EdgeInsets.only(bottom: 30),
                        child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 40),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Tu nombre",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18)),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      labelText: '¿Cómo quieres que te llamemos?',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Porfavor llena el campo con la información solicitada';
                                      }
                                      return null;
                                    },
                                  )),
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 40),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Correo de contacto",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18)),
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      labelText: '¿Cómo podemos contactarte?',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Porfavor llena el campo con la información solicitada';
                                      }
                                      return null;
                                    },
                                  )),
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 40),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Teléfono de contacto",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18)),
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.80,
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      labelText: 'Tu teléfono',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Porfavor llena el campo con la información solicitada';
                                      }
                                      return null;
                                    },
                                  )),
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(left: 40),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Escríbenos tus dudas",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18)),
                                ),
                              ),

                              Container(

                                  width: MediaQuery.of(context).size.width * 0.80,
                                  margin: EdgeInsets.only(left:12,top:12,right:12,bottom: 31),
                                  //numero de lineas maximas
                                  // n * ##
                                  height: 5 * 24.0,

                                  child: TextFormField(
                                    maxLines: null,
                                    style: TextStyle(color: Colors.white),
                                    //obscureText: true,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.white),

                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor llena el campo con la información solicitada';
                                      }
                                      return null;
                                    },
                                  )),

                            Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: SizedBox(
                                    height: 70,
                                    width: 320,
                                    child: RaisedButton(
                                      color: myblue,
                                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs())),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                                      child: const Text('Enviar' , style: TextStyle(color: Colors.white,fontSize: 26)),
                                    ),))


                            ])))),





              ]),
            )));
  }


}



