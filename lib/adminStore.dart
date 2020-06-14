import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/homepage.dart';
import 'package:metromobile/navbar.dart';

class MmAdminStore extends StatefulWidget {
  @override
  MmAdminStoreState createState() => MmAdminStoreState();
}

class MmAdminStoreState extends State<MmAdminStore> {
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
    MaterialColor myGrey = MaterialColor(0xFF36393F, grayDisc);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);

    return Scaffold(
      body: SingleChildScrollView(
        child: 
        Container(
          width: double.infinity,
          height: 800,
          color: myGrey,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top:32, left: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: new IconButton(
                    icon: new Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MmNavbarStateful()));
                    },
                  ),
                )
              ),
              Container(
                width: double.infinity,
                child:
                  Text("Añade un nuevo producto", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),)
              ),
              Form(
                //key: _formKey,
                child: Column( children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 25, top: 25),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Text(
                      'Añade un nuevo producto a nuestro catálogo', textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          fillColor: Colors.black.withOpacity(0.5),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Nomre del Producto',
                        ),
                        validator: (value) =>  value.isEmpty ? 'Ingresa un nombre' : null,
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          fillColor: Colors.black.withOpacity(0.5),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Descripción',
                        ),
                        validator: (value) =>  value.isEmpty ? 'Ingresa la descripción' : null,
                      )
                  ),
                  SizedBox(height: 12.0),
                  Container(
                        margin: EdgeInsets.only(bottom: 10),
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
                            labelText: 'Precio del producto',
                          ),
                          validator: (value) =>  value.isEmpty ? 'Ingresa el precio' : null,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            fillColor: Colors.black.withOpacity(0.5),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Imágen del Producto (URL)',
                          ),
                          validator: (value) =>  value.isEmpty ? 'Ingresa la imágen' : null,
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child:
                      RaisedButton(
                        onPressed: () async {},
                        color: myblue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 80, right: 80),
                        child: const Text('Añadir Producto',
                            style: TextStyle(color: Colors.white, fontSize: 22)),
                      )
                  ),
                ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}