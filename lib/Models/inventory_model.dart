class InventoryModel{
   String title;
   double quantity;
  

   InventoryModel({this.title,this.quantity});
   



   InventoryModel.fromJson(Map<String, dynamic> parsedJSON):
     title = parsedJSON['title'],
     quantity = parsedJSON['quantityinGrams'];
   
  

}