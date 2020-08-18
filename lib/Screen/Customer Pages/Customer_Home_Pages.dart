import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hips/Screen/Authentication/loginChecker.dart';
import 'package:hips/Services/authservice.dart';
import 'package:hips/Widgets/Customer_Drawer.dart';

class CustomerHomePage extends StatelessWidget {
  static const routeName = '/csthome';
  
  @override
  Widget build(BuildContext context) {
       final AuthService _auth = AuthService();

    return Scaffold(
        appBar: AppBar(
          title: Text('HiPS'),
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.of(context).pushReplacementNamed(Wrapper.routeName);
                },
                icon: Icon(Icons.person),
                label: Text('Sign out'))
          ],
        ),
        drawer: CustomerHomeDrawer());
  }
}
