import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  // collection reference, creates if not exists
  final CollectionReference scrapperCollection = Firestore.instance.collection('scrappers');

  Future updateUserData(dynamic scrappers_list) async {
    return await scrapperCollection.document(uid).setData({

    });
  }

  // get scrappers stream
  Stream<DocumentSnapshot> get scrappers_list {
    print('User ID');
    return Firestore.instance.collection('scrappers').document(uid).snapshots();
  }

}