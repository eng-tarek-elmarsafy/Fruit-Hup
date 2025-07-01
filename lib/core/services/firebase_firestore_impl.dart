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
  Future<bool> checkIfDataExists(String path, String uId) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.exists;
  }

  @override
  Future getData({
    required String path,
    Map<String, dynamic>? filter,
    String? uId,
  }) async {
    if (uId != null) {
      var data = await firestore.collection(path).doc(uId).get();

      return data.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (filter != null) {
        if (filter['orderBy'] != null) {
          data = data.orderBy(
            filter['orderBy'],
            descending: filter['descending'],
          );
        }
        if (filter['limit'] != null) {
          data = data.limit(filter['limit']);
        }
      }

      var resuilt = await data.get();
      return resuilt.docs.map((e) => e.data()).toList();
    }
  }
}
