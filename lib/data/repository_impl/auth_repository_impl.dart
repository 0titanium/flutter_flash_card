import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_flash_card/data/mapper/google_user_mapper.dart';
import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:flutter_flash_card/domain/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._googleSignIn, this._firebaseAuth);

  @override
  Future<FlashCardUser> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw Exception('Google Sign In Canceled');

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final firebase_auth.AuthCredential credential =
          firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      return googleUser.toUser();
    } catch (e) {
      throw Exception('Failed to sign in with Google: ${e.toString()}');
    }
  }

  @override
  Future<void> signOutWithGoogle() async {
    await Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}