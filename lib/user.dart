import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/auth.dart';
import 'package:metromobile/editUser.dart';
import 'package:metromobile/navbar.dart';

class MmUserStateful extends StatefulWidget {
  @override
  MmUser createState() => MmUser();
}

class MmUser extends State<MmUserStateful> {

  final AuthService _auth = AuthService();

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
                height: 825,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MmNavbarStateful()));
                          },
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 50, bottom: 10),
                      child: Text(
                        "Mi cuenta",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      )),
                  Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.only(bottom: 20, top: 20.0),
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin:
                                const EdgeInsets.only(right: 10.0, left: 16),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/harold.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            width: 220,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    width: 220,
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text('Usuario',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    width: 220,
                                    child: Text('Harold',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18))),
                              ],
                            ),
                          ),
                        ],
                      )),
                  RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MmUserEditStateful())),
                    color: myblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 105, right: 105),
                    child: const Text('Editar',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        onPressed: () async {
                          await _auth.signOut();
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 75, right: 75),
                        child: const Text('Cerrar Sesión',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      )),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Email",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("memeinhaler2016@gmail.com",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 2,
                                        fontSize: 18)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 30),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("\nHistorial de Compras",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Pedido #35138524",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Pedido #63842568",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Pedido #85369201",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("\nDirección asociada a la cuenta",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("En la casa de tu puta madre #69 Nice, Col. El pueblo perdido de Macías",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 18)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
