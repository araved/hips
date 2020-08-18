import 'dart:io';

import 'package:hips/Services/authservice.dart';

import '../Models/inventory.dart';

import 'inventory_notifier.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

getInventory(InventoryNotifier inventoryNotifier) async {
  

  var user = await FirebaseAuth.instance.currentUser();
  var querySnapshot =await Firestore.instance
      .collection('userProfile')
      .document(user.uid)
      .collection('inventory')
      .getDocuments();
List<Inventory> _inventoryList = [];
  querySnapshot.documents.forEach((element) { 
    Inventory inventory = Inventory.fromMap(element.data);
    _inventoryList.add(inventory);
  });
  inventoryNotifier.inventoryList = _inventoryList;

}
