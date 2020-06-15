import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/category.dart';
import 'package:metromobile/categoryM.dart';
import 'package:metromobile/productM.dart';
import 'package:metromobile/database.dart';
import 'package:metromobile/navbar.dart';
import 'package:provider/provider.dart';

class MmStoreStateful extends StatefulWidget {
  @override
    MmStore createState() => MmStore();
  }

class MmStore extends State<MmStoreStateful> {

  @override
  Widget build(BuildContext context) {

  final categories = Provider.of<List<CategoryM>>(context);

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
                    labelText: 'Buscar un Producto',
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Category(categories[index]);
                  },),
              ),
              SizedBox(height: 260,)
            ],
          ),
        )
      ),
    );
  }
}

class Category extends StatelessWidget {
  final CategoryM category;

  Category(this.category);


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ProductM>>.value(
        value: DatabaseService().getCategoryProducts(category.id),
        child: new InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MmCategoryStateful(category.id))),
          child: Row(
            children: <Widget>[
              Container(width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 0, right: 10.0, left: 16,bottom: 30),
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(category.url),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              ),
              Container(
                width: 220,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 220,
                        margin: EdgeInsets.only(top: 0,bottom: 20),
                        child:
                        Text(category.name, textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold))
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    )
      ;
  }
}