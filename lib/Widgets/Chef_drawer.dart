import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hips/Screen/Chef%20Pages/Chef_home_page.dart';
import 'package:hips/Screen/Chef%20Pages/inventory_page.dart';
import 'package:hips/Screen/Chef%20Pages/kitchen_screen.dart';

class ChefHomeDrawer extends StatelessWidget {
  Widget _buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height:20),
          _buildListTile(Icons.home, 'Home', () => Navigator.of(context).pushNamed(ChefHomePage.routeName)),
          _buildListTile(Icons.kitchen, 'Book Kitchen', () => Navigator.of(context).pushNamed(KitchenScreen.routeName)),
          _buildListTile(Icons.restaurant_menu, 'Menu', (){}),
          _buildListTile(Icons.monetization_on, 'Sales', (){}),
          _buildListTile(Icons.shopping_cart, 'Inventory', (){
            Navigator.of(context).pushReplacementNamed(InventoryPage.routeName);
          })
        ],

      ),
    );
 
  }
}
