import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livescraping/screens/home/scrapper_tile.dart';
import 'package:provider/provider.dart';

class ScrappersList extends StatefulWidget {
  @override
  _ScrappersListState createState() => _ScrappersListState();
}

class _ScrappersListState extends State<ScrappersList> {

  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  Widget build(BuildContext context) {

    refreshKey = GlobalKey<RefreshIndicatorState>();
    final scrappers = Provider.of<DocumentSnapshot>(context);
    final List scrappers_list = [];
    if (scrappers != null){
      scrappers.data.forEach((k, v) => scrappers_list.add(v));
    }
    print(scrappers_list);
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {
        if (scrappers != null) {
          scrappers.data.forEach((k, v) => scrappers_list.add(v));
        }
      },
      child: ListView.builder(
        itemCount: scrappers_list.length,
        itemBuilder: (context, index) {
          return ScapperTile(scrappers_item: scrappers_list[index]);
        },
      ),
    );
  }
}
