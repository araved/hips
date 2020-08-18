import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomerHomeDrawer extends StatelessWidget {
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
          _buildListTile(Icons.home, 'Home', (){}),
          _buildListTile(Icons.restaurant_menu, 'Orders', (){}),
          _buildListTile(Icons.add_comment, 'Feedback', (){})
        ],

      ),
    );
 
  }
}
