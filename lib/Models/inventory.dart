
import 'package:flutter/material.dart';

class Inventory{
   String name;
   double qty;
   String id;
  

   Inventory({this.id,this.name,this.qty});
   
   Inventory.fromMap(Map <String, dynamic> data)
   {
     name = data['name'];
     qty = data['qty'];
   }
   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'qty': qty,
    };
   }

   Inventory.fromJson(Map<String, dynamic> parsedJSON):
     name = parsedJSON['title'],
        qty = parsedJSON['quantityinGrams'];
   
  

}
class IngredientsList with ChangeNotifier {
  Map<String, Inventory> _ingredient = {};

  Map<String, Inventory> get ingredient {
    return {..._ingredient};
  }

  int get ingredientCount {
    return _ingredient.length;
  }


}
