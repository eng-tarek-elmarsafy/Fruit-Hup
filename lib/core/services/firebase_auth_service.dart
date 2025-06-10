import 'dart:developer' as developer;
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
// import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
//MARK:create account
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

  //MARK:EmailAndPassword
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

  //MARK:Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      developer.log('FirebaseAuthException: ${e.code} - ${e.message}');
      throw CustomException(message: e.code);
    } catch (e) {
      developer.log('Unknown error during Google Sign-In: $e');
      rethrow;
    }
  }

  //MARK:Facebook
  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    );
    final user = userCredential.user;
    if (user == null) {
      throw CustomException(message: 'Failed to sign in with Facebook.');
    }
    return user;
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  //MARK:Apple
  Future<User> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    );
    if (userCredential.user == null) {
      throw CustomException(message: 'Failed to sign in with Apple.');
    }
    return userCredential.user!;
  }
}
