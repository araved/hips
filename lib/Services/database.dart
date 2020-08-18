import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hips/Models/inventory.dart';
import 'package:hips/Models/inventory_model.dart';
import 'package:hips/Models/user.dart';

class DatabaseService {
//collection reference
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userProfile =
      Firestore.instance.collection('userProfile');
  final CollectionReference bookings =
      Firestore.instance.collection('bookings');
  final CollectionReference meals = Firestore.instance.collection('meals');
  final CollectionReference inventory =
      Firestore.instance.collection('inventory');

  Future updateUserData(
    String email,
    String password,
    String name,
    String usertype,
  ) async {
    return await userProfile.document(uid).setData({
      'email': email,
      'password': password,
      'name': name,
      'usertype': 'Customer'
    });
  }

  Future updateKitchenBooking(DateTime startDate, DateTime endDate) async {
    return await bookings.document().setData({
      'User': uid,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
    });
  }
  //     Future updateInventoryData( String title, double qty, String id)async {

  //   return await inventory
  //       .document()
  //       .setData({'title': title, 'quantity(Grams)': qty, 'ownerId': id});
  // }

  Future updateInventoryData(String title, double qty, String id) async {
    return await userProfile
        .document(id)
        .collection('inventory')
        .add({'title': title, 'quantityinGrams': qty});
  }

  Future amendInventoryData(
      String uid, String invId, String title, double qty) async {
    return await userProfile
        .document(uid)
        .collection('inventory')
        .document(invId)
        .updateData({'title': title, 'qty': qty});
  }
  // Future amendInventoryData (String docid, String title, double qty) async {
  //   return await inventory.document(docid).updateData({'title': title, 'quantity(Grams)':qty});
  // }
  // Future deleteInventoryData (String id)async
  // {
  //   return await inventory.document(id).delete();
  // }

  Future fetchInventoryData (String name, double qty) async {
   FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var result=  await userProfile.document(user.uid).collection('inventory').document().get().then((value) {
     name= value['title'];
     qty = value['quantity(Grams)'];
    }
    ); 
    return result;
  }

  Stream<List<InventoryModel>> getinventoryList(String uid) {
       return userProfile.document(uid).collection('inventory')
       .snapshots()
       .map((event) => event.documents
       .map((value) => InventoryModel.fromJson(value.data)).toList());
       
  }


}
