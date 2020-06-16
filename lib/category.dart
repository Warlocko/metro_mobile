import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/product.dart';
import 'package:provider/provider.dart';
import 'package:metromobile/productM.dart';
import 'package:metromobile/database.dart';

class MmCategoryStateful extends StatefulWidget {
  final String id;
  final String uid;
  final String catName;

  MmCategoryStateful(this.id, this.uid, this.catName);

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
    MaterialColor myGrey = MaterialColor(0xFF36393F, color);
    return StreamProvider<List<ProductM>>.value(
          value: DatabaseService().getCategoryProducts(widget.id),
          child: Scaffold(
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
                      Text(widget.catName, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26),)
                  ),
                  ProductCard(widget.id, widget.uid),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String id;
  final String uid;

  ProductCard(this.id, this.uid);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
              child: StreamBuilder(
                stream: Firestore.instance.collection('categories').document(widget.id).collection('productos').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Text('No Data');
                  }else{
                  return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    var productCollection = snapshot.data.documents;
                    return Product(productCollection[index]['name'],productCollection[index]['description'],productCollection[index]['price'],productCollection[index]['url'],widget.uid);
                    },
                  );
                  }
                }
              ),
            );
  }
}

class Product extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String url;
  final String uid;

  Product(this.name,this.description,this.price,this.url,this.uid);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MmProductStateful(this.name,this.description,this.price,this.url,this.uid))),
        child: Row(
          children: <Widget>[
            Container(width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(this.url),
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