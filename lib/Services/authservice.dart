import 'package:firebase_auth/firebase_auth.dart';
import 'package:hips/Models/user.dart';
import 'database.dart';


class AuthService {
    final FirebaseAuth _auth = FirebaseAuth.instance;
User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(user.uid) : null;
  }
   Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

   Future getCurrentUser() async {
    return await _auth.currentUser();
  }
    Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
  Future registerWithEmailAndPassword(String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(email, password, name, 'Customer');
      await updateUserName(name, result.user);
      return _userFromFirebaseUser(user);
      
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
    Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}