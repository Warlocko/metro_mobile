import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/product.dart';

class MmCategoryStateful extends StatefulWidget {
  @override
  MmCategory createState() => MmCategory();
}

class MmCategory extends State<MmCategoryStateful> {
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
    MaterialColor myGrey = MaterialColor(0xFF36393F, color);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        Navigator.pop(context);
                      },
                    ),
                  )
              ),
              Container(
                  width: double.infinity,
                  child:
                  Text("Válvulas", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),)
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
                    labelText: 'Buscar un Producto',
                  ),
                ),
              ),
              Product("assets/valvula1.jpg", "Válvula de compuerta 150",
                  "33,250.30"),
              Product("assets/valvula4.jpg", "Válvula de esfera de latón",
                  "168.20"),
              Product(
                  "assets/valvula2.jpg", "Válvula esfera 400", "230.00"),
              Product(
                  "assets/valvula3.jpg", "Válvula check de oxígeno", "214.29"),
            ],
          ),
        ),
      ),
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
    return new InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MmProductStateful(this.name,this.image,this.price))),
      child: Row(
        children: <Widget>[
          Container(width: 100,
            height: 100,
            margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 15),
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
      ),
    );
  }
}