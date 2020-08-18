import 'package:flutter/material.dart';
import 'package:hips/Models/inventory_model.dart';
import 'package:hips/Screen/Chef%20Pages/edit_ingredient_page.dart';
import 'package:hips/Services/database.dart';
import 'package:hips/Widgets/Chef_drawer.dart';
import 'package:provider/provider.dart';

class InventoryPage extends StatefulWidget {
  static const routeName = '/inventory-page';

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
 
  final DatabaseService dbservice = DatabaseService();
  var _isInit = true;
  var _isLoading = false;
  Map<String,dynamic> ilist = {
    'title' :'',
    'quantity(Grams)': 0.0
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<List<InventoryModel>>(context, listen: false);
     {
        setState(() {
        _isLoading = false;
      });
      }
    }
    _isInit = false;
    super.didChangeDependencies();
    
  }

  Future<void> _refreshItems(BuildContext context) async {
    // await Provider.of<Ingredients>(context).fetchAndSetItem();
    await  Provider.of<DatabaseService>(context).fetchInventoryData(ilist['title'],ilist['quantity(Grams)']);
  }



  @override
  Widget build(BuildContext context) {
   List iList = Provider.of<List<InventoryModel>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Inventory'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.of(context)
                  .pushNamed(EditIngredientScreen.routeName)
                  )
        ],
      ),
      drawer: ChefHomeDrawer(),
      body: RefreshIndicator( onRefresh: () => _refreshItems(context),
      child: Padding(padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: iList.length,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              title: Text(iList[index].title ? null:'anonymus'),
              trailing: Text(iList[index].quantity.toString()),
            ),
            Divider()
          ],
        ),
      ),
      ),
      ),
    );
  }
}
