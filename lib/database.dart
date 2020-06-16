import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metromobile/productM.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/categoryM.dart';

class DatabaseService {

    final String uid;
    DatabaseService({this.uid});

    final CollectionReference userCollection = Firestore.instance.collection('user');
    final CollectionReference categoriesCollection = Firestore.instance.collection('categories');
    final CollectionReference ordersCollection = Firestore.instance.collection('orders');

    Future updateUserData(String role, String email, String username, String address, String picUrl) async{
        return await userCollection.document(uid).setData({
           'role': role,
           'email': email,
           'username': username,
           'address': address,
           'picUrl': picUrl,
        });
    }

    Future updateProductData(String cid, String name, String description, String url, String price) async{
        return await categoriesCollection.document(cid).collection('productos').document().setData({
          'name': name,
          'description': description,
          'price': price,
          'url': url,
        });
    }

    Future updateOrderData(String oid, String prodName, String uid, String username, String address, String price, String date) async{
        return await ordersCollection.document().setData({
          'orderID': oid,
          'product': prodName,
          'userID': uid,
          'address': address,
          'username': username,
          'monto': price,
          'fecha': date,
        });
    }

    List<ProductM> _productListFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.documents.map((doc){
        return ProductM(
          name: doc.data['name'] ?? '',
          description: doc.data['description'] ?? '',
          price: doc.data['price'] ?? '',
          url: doc.data['url'] ?? 'https://www.creativefabrica.com/wp-content/uploads/2019/03/Box-icon-by-ahlangraphic.jpg',
        );
      }).toList();
    }

    List<CategoryM> _categoryListFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.documents.map((doc){
        return CategoryM(
          name: doc.data['name'] ?? '',
          url: doc.data['url'] ?? 'https://www.creativefabrica.com/wp-content/uploads/2019/03/Box-icon-by-ahlangraphic.jpg',
          id: doc.documentID ?? '',
          );
      }).toList();
    }

    UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
      return UserData(
        role: snapshot.data['role'],
        uid: uid,
        name: snapshot.data['username'],
        url: snapshot.data['picUrl'],
        address: snapshot.data['address'],
        mail: snapshot.data['email'],
      );
    }

    Stream<QuerySnapshot> get users {
      return userCollection.snapshots();
    }

    Stream<List<CategoryM>> get categories {
      return categoriesCollection.snapshots().map(_categoryListFromSnapshot);
    }

    Function(String) get products {
      return getCategoryProducts;
    }

    Stream<List<ProductM>> getCategoryProducts(String cid)  {
      CollectionReference categoryCollection = Firestore.instance.collection('categories').document(cid).collection('productos');
      return categoryCollection.snapshots().map(_productListFromSnapshot);
    }

    Stream<UserData> get userData {
      return userCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
    }

}