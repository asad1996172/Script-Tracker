import 'package:flutter/material.dart';

import 'detailed_data.dart';

class ScapperTile extends StatelessWidget {
  final dynamic scrappers_item;

  ScapperTile({this.scrappers_item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTileTheme(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: ListTile(
            onTap: () {
              print('Tapped !!');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailedInformation(scrappers_item: scrappers_item);
              }));
            },
            title: Row(
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
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
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
              ],
            ),
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 15.0,
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Text("Total Records Scraped: ",
//                          style: TextStyle(
//                              color: Colors.orange,
//                              fontWeight: FontWeight.bold)),
//                      Text(scrappers_item['records_scraped'].toString(),
//                          style: TextStyle(color: Colors.orange))
//                    ],
//                  ),
//                ],
//              ),
//            ],
          ),
        ),
      ),
    );
  }
}
