import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomException(message: 'An error occurred. Please try again.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'Wrong password provided for that user.',
        );
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomException(message: 'An error occurred. Please try again.');
    }
  }

  Future<User?> signInWithGoogle() async {
  try {
    // 1. بدء عملية تسجيل الدخول
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // لو المستخدم لغى تسجيل الدخول
    if (googleUser == null) {
      return null; // المستخدم لغى العملية
    }

    // 2. الحصول على التوكينات
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // 3. إنشاء الـ credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4. تسجيل الدخول في Firebase
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    print('FirebaseAuthException: ${e.code} - ${e.message}');
    rethrow; // أو تقدر ترمي CustomException
  } catch (e) {
    print('Unknown error during Google Sign-In: $e');
    rethrow;
  }
}
}
