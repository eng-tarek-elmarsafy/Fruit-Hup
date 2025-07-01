import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/core/services/firebase_firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirebaseFirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
    String path,
    String? uId,
    Map<String, dynamic> data,
  ) async {
    if (uId != null) {
      await firestore.collection(path).doc(uId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(String path, {String? uId}) async {
    if (uId != null) {
      var data = await firestore.collection(path).doc(uId).get();

      return data.data() as Map<String, dynamic>;
    } else {
      var data = await firestore.collection(path).get();

      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(String path, String uId) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.exists;
  }
}
