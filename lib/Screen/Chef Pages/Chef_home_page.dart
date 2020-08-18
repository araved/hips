import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hips/Models/user.dart';
import 'package:hips/Screen/Authentication/loginChecker.dart';
import 'package:hips/Services/authservice.dart';
import 'package:hips/Widgets/Chef_drawer.dart';

class ChefHomePage extends StatefulWidget {
  static const routeName = '/chef-home';

  @override
  _ChefHomePageState createState() => _ChefHomePageState();
}

class _ChefHomePageState extends State<ChefHomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Future<String> _getProfileData() async {
      final uid = await FirebaseAuth.instance.currentUser();
      var query =
          Firestore.instance.collection('userProfile').document(uid.uid).get();
      var type = await query.then((value) => value.data['name']);

      return type;
    }

    return Scaffold(
      appBar: AppBar(title: Text('HiPS'), actions: [
        FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pushReplacementNamed(Wrapper.routeName);
            },
            icon: Icon(Icons.person),
            label: Text('Sign out')),
      ]),
      drawer: ChefHomeDrawer(),
      body: FutureBuilder(
        future: _getProfileData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome: ${snapshot.data}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}
