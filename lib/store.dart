import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/category.dart';
import 'package:metromobile/categoryM.dart';
import 'package:metromobile/productM.dart';
import 'package:metromobile/database.dart';
import 'package:metromobile/navbar.dart';
import 'package:provider/provider.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/loading.dart';

class MmStoreStateful extends StatefulWidget {
  @override
    MmStore createState() => MmStore();
  }

class MmStore extends State<MmStoreStateful> {

  String _currentCategory;
  String _categoryName;
  List<String> categoriesList = ['Válvulas', 'Bombas', 'Tuberías', 'Placas'];
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {

  final _formKey = GlobalKey<FormState>();
  
  final user = Provider.of<UserM>(context);

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
    return StreamBuilder<Object>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          if(userData.role == 'User'){
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
          }else{
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
                key: _formKey,
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
                          labelText: 'Nombre del Producto',
                        ),
                        validator: (value) =>  value.isEmpty ? 'Ingresa un nombre' : null,
                        controller: nameController,
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
                        controller: descriptionController,
                      )
                  ),
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
                          controller: priceController,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 55,
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
                          validator: (value) =>  value.isEmpty ? 'Ingresa el url de la imágen' : null,
                          controller: urlController,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            fillColor: Colors.black.withOpacity(0.5),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: _categoryName,
                          ),
                          items: categoriesList.map((category){
                            return DropdownMenuItem(
                              value: category,
                              child: Text('$category'),
                            );
                          }).toList(),
                          onChanged: (val) => setState((){
                          switch (val) {
                            case 'Tuberías':
                              _currentCategory = 'JYH3bWPBSwXbojKg6UZ4';
                              _categoryName = 'Tuberías';
                              break;
                            case 'Bombas':
                              _currentCategory = 'QgECyyO02BSCulOb8TiC';
                              _categoryName = 'Bombas';
                              break;
                            case 'Válvulas':
                              _currentCategory = 'jZCJYDKfGtIFm95Y8RtZ';
                              _categoryName = 'Válvulas';
                              break;
                            case 'Placas':
                              _currentCategory = 'nsZvE0W9TZ3N5BOF7tic';
                              _categoryName = 'Placas';
                              break;
                            default:
                              _currentCategory = 'jZCJYDKfGtIFm95Y8RtZ';
                            break;
                          }}),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child:
                      RaisedButton(
                        onPressed: () async {
                            if(_formKey.currentState.validate()){
                                await DatabaseService().updateProductData(
                                  _currentCategory,
                                  nameController.text ?? 'Producto Inválido',
                                  descriptionController.text ?? 'Sin descripción',
                                  urlController.text ?? 'https://lh3.googleusercontent.com/proxy/vky2xIaLoUCsU7CwcFNJ0hIxs8fZC-8RDcdIlXPnPn8BHb6lN6JIdkQC2UBY3AWQBNlDoCfCMH6SjitvKaJeQh9RcqaYmnWoM9NyHSGdpwKIYwSHmYLqNIHLvF53',
                                  priceController.text ?? '0.0');
                              }
                               Navigator.push(context, MaterialPageRoute(builder: (context) => MmNavbarStateful()));
                            },
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
        }else{
          return Loading();
        }
        
      }
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