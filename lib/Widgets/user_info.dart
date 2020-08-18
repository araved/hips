


import 'package:flutter/material.dart';

Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
        ),



      ],
    );
  }