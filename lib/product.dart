import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/purchase.dart';

class MmProductStateful extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  MmProductStateful(this.name,this.image,this.price);

  @override
  MmProduct createState() => MmProduct();
}

class MmProduct extends State<MmProductStateful> {

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
              height: 770,
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
                      margin: EdgeInsets.only(bottom: 20),
                      child:
                      Text(widget.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),)
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("Está válvula de uso profesional permite el paso de grandes cantidades de presión y es considerada de uso profesional para grandes sistemas hidráulicos. \n\nSu instalación es fácil e intuitiva y es capaz de ser muy escalable según el sistema en el que se trabaje.",  style: TextStyle(color: Colors.white, height: 1.5, fontSize: 18)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Text('\$${widget.price} MXN', style: TextStyle(color: Colors.orange, fontSize: 18)),
                  ),
                  const SizedBox(height: 25),
                  RaisedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MmPurchaseStateful(widget.price)

                    )),
                    color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 75, right: 75),
                    child: const Text('Comprar', style: TextStyle(color: Colors.white, fontSize: 26)),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}