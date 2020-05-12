import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/homepage.dart';

class MmStoreStateful extends StatefulWidget {
  @override
    MmStore createState() => MmStore();
  }

class MmStore extends State<MmStoreStateful> {

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
          height: 710,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MmHomepageStateful()),
                        );
                      },
                    ),
                  )
                ),
              Container(
                width: double.infinity,
                child:
                  Text("Nuestro Catálogo", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),)
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(),
                    fillColor: Colors.black.withOpacity(0.5),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Buscar',
                  ),
                ),
              ),
              Category("assets/valvula1.jpg", "Válvulas"),
              Category("assets/bomba1.jpg", "Bombas"),
              Category("assets/tubos2.jpg", "Tuberías"),
              Category("assets/placa1.jpg", "Placas de acero al carbón"),
            ],
          ),
        )
      ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type : BottomNavigationBarType.fixed,
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              title: Text(''),
            ),
          ],
          currentIndex: 1,
          selectedItemColor: Colors.amber[800],
          backgroundColor: myblue,
        )
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String name;

  Category(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 100,
          height: 100,
          margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(this.image),
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
                  margin: EdgeInsets.only(top: 50,bottom: 20),
                  child:
                  Text(this.name, textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold))
              ),
            ],
          ),
        )
      ],
    );
  }
}