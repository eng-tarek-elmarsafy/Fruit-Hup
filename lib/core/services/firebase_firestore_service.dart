abstract class FirebaseFirestoreService {
  Future<void> addData(String path, String? uId, Map<String, dynamic> data);
  Future<dynamic> getData(
  {required  String path,
    Map<String, dynamic>? filter, 
    String? uId,
  });

  Future<bool> checkIfDataExists(String path, String uId);
}
