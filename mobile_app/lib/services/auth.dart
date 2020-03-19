import 'package:livescraping/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:livescraping/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
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

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      dynamic user_dummy_data = {
        'script_name': 'Yelp Scrapper',
        'status': 'Running',
        'records_scraped': 50,
        'records_crashed': 5,
        'time_elapsed': '30:50',
        'unique_crash_logs': ['Element not found', 'Exit Webpage 404']
      };
      dynamic user_dummy_data_2 = {
        'script_name': 'LinkedIn Scrapper',
        'status': 'Running',
        'records_scraped': 100,
        'records_crashed': 15,
        'time_elapsed': '05:45',
        'unique_crash_logs': ['200 OK', 'Exit 414']
      };
      List scrappers_list = [user_dummy_data, user_dummy_data_2];
      await DatabaseService(uid: user.uid).updateUserData(scrappers_list);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}