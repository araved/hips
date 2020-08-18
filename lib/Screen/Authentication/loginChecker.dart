import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hips/Models/user.dart';
import 'package:hips/Screen/Authentication/welcome.dart';
import 'package:hips/Screen/Chef%20Pages/Chef_home_page.dart';
import 'package:hips/Screen/Customer%20Pages/Customer_Home_Pages.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  static const routeName = '/wrapper';

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  Future<String> typeChecker(BuildContext context) async {
    var user = await FirebaseAuth.instance.currentUser();
    var query =
        Firestore.instance.collection('userProfile').document(user.uid).get();
    var type = await query.then((value) => value.data.containsValue('Chef'));
   return type.toString();
   
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return FutureBuilder(
        future: typeChecker(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(title: Text('HiPS')),
              body: Align(child: CircularProgressIndicator(backgroundColor: Colors.white,)));
          }
          if (snapshot.connectionState == ConnectionState.done) {
              if (user == null) {
            return WelcomeUI();
          } else {
            if (snapshot.data == 'false') {
               return CustomerHomePage();
            } else {
              return ChefHomePage();
            }
          }
          }

        
        });
  }
}
