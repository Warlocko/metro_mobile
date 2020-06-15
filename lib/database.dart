import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metromobile/productM.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/categoryM.dart';

class DatabaseService {

    final String uid;
    DatabaseService({this.uid});

    final CollectionReference userCollection = Firestore.instance.collection('user');
    final CollectionReference categoriesCollection = Firestore.instance.collection('categories');

    Future updateUserData(String email, String username, String address, String picUrl) async{
        return await userCollection.document(uid).setData({
           'email': email,
           'username': username,
           'address': address,
           'picUrl': picUrl,
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