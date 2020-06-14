import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/auth.dart';
import 'package:metromobile/loading.dart';

class MmRegisterStateful extends StatefulWidget {

  final Function toggleView;
  MmRegisterStateful({this.toggleView});

  @override
  MmRegister createState() => MmRegister();
}

class MmRegister extends State<MmRegisterStateful>{

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String username = '';
  String email = '';
  String password = '';
  String error = '';

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
    MaterialColor myColor = MaterialColor(0xFF36393F, color);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);

    return loading ? Loading() : Scaffold(
        body: SingleChildScrollView(
          child:
          Column(
            children: <Widget> [
              Container(
                width: double.infinity,
                height: 800,
                color: myColor,
                child: Form(
                  key: _formKey,
                  child: Column( children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 25, top: 110),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Text(
                        'Registrarse', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,
                          fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Text(
                        'Introduce los datos de la nueva cuenta', textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextFormField(
                          onChanged: (val){
                            setState(() => username = val);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            fillColor: Colors.black.withOpacity(0.5),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Nombre de usuario',
                          ),
                            validator: (value) =>  value.isEmpty ? 'Ingresa un usuario' : null,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextFormField(
                          onChanged: (val){
                            setState(() => email = val);
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            fillColor: Colors.black.withOpacity(0.5),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Correo Electrónico',
                          ),
                          validator: (value) =>  value.isEmpty ? 'Ingresa un correo' : null,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextFormField(
                          onChanged: (val){
                            setState(() => password = val);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            fillColor: Colors.black.withOpacity(0.5),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: 'Contraseña',
                          ),
                          obscureText: true,
                          validator: (value) =>  value.length < 8 ? 'Ingresa un password mayor a 8 caracteres' : null,
                        )
                    ),
                    Container(
                      child:
                      FlatButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text("¿Tienes una cuenta registrada?" ,style: TextStyle(color: Colors.orange, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child:
                        RaisedButton(
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              setState(() => loading = true);
                              dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                              if(result == null){
                                setState(() {
                                  error = 'Ingresa un correo válido.';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 75, right: 75),
                          child: const Text('Crear una cuenta',
                              style: TextStyle(color: Colors.white, fontSize: 22)),
                        ),
                    ),
                  ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}