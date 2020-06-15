import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/database.dart';
import 'package:provider/provider.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/loading.dart';

class MmHomepageStateful extends StatefulWidget {
  @override
  MmHomepage createState() => MmHomepage();
}

class MmHomepage extends State<MmHomepageStateful> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserM>(context);

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
    MaterialColor myColor = MaterialColor(0xFF36393F, color);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Scaffold(
              body: SingleChildScrollView(
                  child:
                  Column(
                    children: <Widget>[
                  Container(
                  width: double.infinity,
                    height: 560,
                    color: myColor,
                    padding: EdgeInsets.only(top: 32, left: 16, bottom: 0),
                    child: Column(
                      children: <Widget>[
                        MmUserWelcomeStateful(userData.name,userData.url),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 40),
                          child: Text(
                              'Nuestras Recomendaciones', textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white, fontSize: 22)),
                        ),
                        Product("assets/valvula1.jpg", "Válvula de compuerta 150",
                            "33,250.30"),
                        Product(
                            "assets/valvula2.jpg", "Válvula esfera 400", "230.00"),
                        Product(
                            "assets/tubos1.jpg", "Tubería para perforación", "10.00"),
                      ],
                    )
                  ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(bottom: 10, top: 10, left: 16),
                            color: myColor,
                            child: Text(
                                'Ofertas', textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontSize: 22)),
                          ),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 0),
                              color: myColor,
                              child: Offers()
                          )
                        ],
                      ),
                    ],
                  )
              ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}

class MmUserWelcomeStateful extends StatefulWidget {
  final String username;
  final String url;

  MmUserWelcomeStateful(this.username,this.url);

  @override
  MmUserWelcome createState() => MmUserWelcome();
}

class MmUserWelcome extends State<MmUserWelcomeStateful> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(top: 0,right: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.url),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Text('¡Bienvenido, ${widget.username}!',
            style: TextStyle(color: Colors.white, fontSize: 26))
      ],
    );
  }
}

class Offers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        color: Colors.black.withOpacity(0.5),
        padding: EdgeInsets.only(top: 15, left: 0),
        child:
        Column(
          children: <Widget>[
            Text("¡10% en bombas y válvulas!", style: TextStyle(fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
            Text(
                "Consigue un descuento especial en todas nuestras bombas y válvulas",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white))
          ],
        )
    );
  }
}

class Product extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  Product(this.image, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 100,
          height: 100,
          margin: const EdgeInsets.only(top: 30.0, right: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(this.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: 220,
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[
              Container(
                  width: 220,
                  margin: EdgeInsets.only(top: 15,bottom: 20),
                  child:
                  Text(this.name, textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
              ),
              Row(

                children: <Widget>[
                  Text("\$${this.price}",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.left),
                  Container(
                      margin: EdgeInsets.only(left: 50),
                      child:
                      Text("Comprar",
                          style: TextStyle(color: Colors.orange, fontSize: 16))
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}



