import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livescraping/models/user.dart';
import 'package:livescraping/screens/home/scrappers_list.dart';
import 'package:livescraping/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:livescraping/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamProvider<DocumentSnapshot>.value(
      value: DatabaseService(uid: user.uid).scrappers_list,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF2A0250),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text(
                  'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: ScrappersList(),
      ),
    );
  }
}