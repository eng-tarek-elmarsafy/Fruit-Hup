abstract class FirebaseFirestoreService {
  Future<void> addData(String path, String? uId, Map<String, dynamic> data);
  Future<Map<String, dynamic>> getData(String path, String uId);
  Future<List<Map<String, dynamic>>> getProaduct(String path);

  Future<bool> checkIfDataExists(String path, String uId);
}
