import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/core/services/firebase_firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirebaseFirestoreService {
  @override
  Future<void> add(String path, Map<String, dynamic> data) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection(path).add(data);
  }
}
