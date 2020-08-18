import 'dart:collection';
import 'package:hips/Models/inventory.dart';
import 'package:flutter/material.dart';

class InventoryNotifier with ChangeNotifier {
  List<Inventory> _inventoryList = [];
  Inventory _currentInventory;

  UnmodifiableListView<Inventory> get inventoryList => UnmodifiableListView(_inventoryList);

  Inventory get currentInventory => _currentInventory;

    set inventoryList(List<Inventory> inventoryList) {
    _inventoryList = inventoryList;
    notifyListeners();
  }

  set currentinventory(Inventory inventory) {
    _currentInventory = inventory;
    notifyListeners();
  }
  
    addInventory(Inventory inventory) {
    _inventoryList.insert(0, inventory);
    notifyListeners();
  }
}