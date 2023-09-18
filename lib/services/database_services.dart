import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServiecs {
  String collectionPath;

  late final CollectionReference<Map<String, dynamic>> _db;

  DataBaseServiecs({
    required this.collectionPath,
  }) {
    _db = FirebaseFirestore.instance.collection(collectionPath);
  }

  // read collection data
  Future<QuerySnapshot<Map<String, dynamic>>> read() async {
    return _db.get();
  }

  // get collection stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getDateStream() {
    return _db.snapshots();
  }

  // write date on collection
  Future write(Map<String, dynamic> data, {String? path}) async {
    await _db.doc(path).set(data);
  }

  // update date on collection
  Future update(Map<String, dynamic> data, {String? path}) async {
    await _db.doc(path).update(data);
  }

  // delete data on collection
  Future delete({String? path}) async {
    await _db.doc(path).delete();
  }
}
