import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/navbar.dart';

class MmUserEditStateful extends StatefulWidget {
  @override
  MmUserEdit createState() => MmUserEdit();
}

class MmUserEdit extends State<MmUserEditStateful> {
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
                height: 900,
                color: myGrey,
                child: Column(children: <Widget>[
                  Container(
                    width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.only(bottom: 20, top: 20.0),
                      margin: EdgeInsets.only(top: 100, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    width: 300,
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text('Usuario',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 50,
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.black.withOpacity(0.5),
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: 'Nombre de Usuario',
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 300,
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text('Imagen de usuario',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            margin:
                            const EdgeInsets.only(right: 10.0, left: 16),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/harold.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      )),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    color: myblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 105, right: 105),
                    child: const Text('Guardar',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  )
                ]))));
  }
}