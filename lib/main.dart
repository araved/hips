import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hips/Models/inventory.dart';
import 'package:hips/Screen/Authentication/loginChecker.dart';
import 'package:hips/Screen/Authentication/welcome.dart';
import 'package:hips/Screen/Chef%20Pages/Chef_home_page.dart';
import 'package:hips/Screen/Chef%20Pages/edit_ingredient_page.dart';
import 'package:hips/Screen/Chef%20Pages/inventory_page.dart';
import 'package:hips/Screen/Chef%20Pages/kitchen_screen.dart';
import 'package:hips/Screen/Customer%20Pages/Customer_Home_Pages.dart';
import 'package:hips/Screen/Web/About_Us.dart';
import 'package:hips/Screen/Web/Web_Page.dart';
import 'package:hips/Services/authservice.dart';
import 'package:hips/Services/database.dart';
import 'package:hips/Services/inventory_notifier.dart';
import 'package:hips/Services/userNotifier.dart';
import 'package:provider/provider.dart';

import 'Models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> getUID() async{
    var user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUID(),
          builder:(context, snapshot) => 
          MultiProvider(
          providers: [
            // ChangeNotifierProvider.value(value: Auth()),
            // ChangeNotifierProxyProvider<Auth, Ingredients>(
            //     update: (ctx, auth, previousIngredients) => Ingredients(
            //         auth.token,
            //         auth.userId,
            //         previousIngredients == null
            //             ? []
            //             : previousIngredients.items)),
            StreamProvider<User>.value(value: AuthService().user),
            Provider.value(value: AuthService()),
            Provider.value(value: DatabaseService()),
            StreamProvider<User>.value(value: DatabaseService().user),
            ChangeNotifierProvider.value(value: IngredientsList()),
            StreamProvider(create: (ctx) => DatabaseService().getinventoryList(snapshot.data)),
            // // Provider(create:(ctx)=> InventoryNotifier()),
            // ChangeNotifierProvider.value(value: InventoryNotifier()),
            ChangeNotifierProvider(create: (ctx) => InventoryNotifier())

            
          ],
          // child: Consumer<Auth>(
          //   builder: (ctx, auth, _) => 
            child: MaterialApp(
              theme: ThemeData(
                  primarySwatch: Colors.lightBlue,
                  accentColor: Colors.greenAccent,
                  backgroundColor: Colors.grey[100],
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Aller'),
                      caption: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Aller'))),
              home: kIsWeb
                  ? WebPageScreen()
                  // : ChefHomePage(),
                  // : auth.isAuth ? 
                  //  auth.customer ?
                  // CustomerHomePage()
                  //  : ChefHomePage()
                   : Wrapper(),
              routes: {
                KitchenScreen.routeName: (ctx) => KitchenScreen(),
                Wrapper.routeName: (ctx) => Wrapper(),
                InventoryPage.routeName: (ctx) => InventoryPage(),
                WelcomeUI.routeName: (ctx) => WelcomeUI(),
                CustomerHomePage.routeName: (ctx) => CustomerHomePage(),
                WebPageScreen.routeName: (ctx) => WebPageScreen(),
                AboutUs.routeName: (ctx) => AboutUs(),
                ChefHomePage.routeName: (ctx) => ChefHomePage(),
                EditIngredientScreen.routeName: (ctx) => EditIngredientScreen(),
              },
            ),
          ),
    );
  }
}
