import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_ambw/dataclass.dart';

CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('posts');

class Database {
  static Stream<QuerySnapshot> getData() {
    return _collectionReference.snapshots();
  }

  static Future<void> addData({required DataAPI data}) async {
    DocumentReference docRef = _collectionReference.doc(data.cTitle);

    await docRef
        .set(data.toJson())
        .whenComplete(() => print('Successful'))
        .catchError((e) => print(e));
  }

  static Future<void> removeData({required DataAPI data}) async {
    DocumentReference docRef = _collectionReference.doc(data.cTitle);

    await docRef
        .delete()
        .whenComplete(() => print('Data Successfully Deleted'))
        .catchError((onError) => print(onError));
  }
}
