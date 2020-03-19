import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:livescraping/models/user.dart';
import 'package:livescraping/services/auth.dart';
import 'package:livescraping/services/database.dart';
import 'package:provider/provider.dart';

class DetailedInformation extends StatelessWidget {
  final AuthService _auth = AuthService();
  final dynamic scrappers_item;

  DetailedInformation({this.scrappers_item});

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Script Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF2A0250),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: new Container(
//                      padding: new EdgeInsets.only(right: 13.0),
                        child: new Text(
                          scrappers_item['script_name'],
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
//                  width: double.infinity,
                      child: FlatButton(
                        disabledColor: scrappers_item['status'] == 'Running'
                            ? Colors.orange
                            : (scrappers_item['status'] == 'Crashed'
                                ? Colors.red
                                : Colors.green),
                        onPressed: null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          scrappers_item['status'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Total Done",
                                style: TextStyle(
                                    color: Color(0xFF2A0250),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
//                  width: double.infinity,
                              child: FlatButton(
                                disabledColor: Color(0xFF2A0250),
                                onPressed: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  scrappers_item['records_scraped'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text("Total Crashed ",
                                style: TextStyle(
                                    color: Color(0xFF2A0250),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
//                  width: double.infinity,
                              child: FlatButton(
                                disabledColor: Color(0xFF2A0250),
                                onPressed: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  scrappers_item['records_crashed'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text("Time ",
                                style: TextStyle(
                                    color: Color(0xFF2A0250),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
//                  width: double.infinity,
                              child: FlatButton(
                                disabledColor: Colors.yellow[400],
                                onPressed: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  scrappers_item['time_elapsed'].toString(),
                                  style: TextStyle(
                                    color: Color(0xFF2A0250),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Exceptions List',
                          style: TextStyle(
                              color: Color(0xFF2A0250),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        for (var item in scrappers_item['unique_crash_logs'])
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                  disabledColor: Color(0xFF2A0250),
                                  onPressed: null,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DatabaseService().scrapperCollection.document(user.uid).updateData({
            scrappers_item['script_name']: FieldValue.delete()
          }).whenComplete(() {
            print('Field Deleted');
          });
          Navigator.pop(context);
        },
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}
