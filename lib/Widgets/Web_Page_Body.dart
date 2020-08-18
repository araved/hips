import 'package:flutter/material.dart';
import 'package:hips/Screen/Authentication/loginChecker.dart';
import 'package:hips/Screen/Web/About_Us.dart';
import 'package:hips/Screen/Web/Web_Page.dart';

class WebPageBody extends StatelessWidget {
  final List<Widget> content;

  const WebPageBody({Key key, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            //SizedBox(height: 20),
            // Text(
            //   'Food Incubator',
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 24),
            // ),
            Image(image: AssetImage('Asset/Images/Harks_Logo.png'),
            fit: BoxFit.fitHeight,)
          ],
        
        ),
        
        title:  
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  'Food Incubator',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
          
        //leadingWidth: 300,
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(WebPageScreen.routeName),
              child: Text('Home')),
          FlatButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(AboutUs.routeName),
              child: Text('About us')),
          FlatButton(onPressed: null, child: Text('Contact')),
          // FlatButton.icon(
          //     onPressed: () => 
          //         Navigator.of(context).pushNamed(Wrapper.routeName),
          //     icon: Icon(Icons.person),
          //     label: Text('Sign In'))
        ],
      ),
      body: ListView(children: content),
    );
  }
}
