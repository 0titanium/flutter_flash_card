import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_flash_card/data/mapper/firebase_user_mapper.dart';
import 'package:flutter_flash_card/data/mapper/google_user_mapper.dart';
import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:flutter_flash_card/domain/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._googleSignIn, this._firebaseAuth);

  @override
  Future<FlashCardUser?> signInWithGoogle() async {
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

      final firebaseUser = _firebaseAuth.currentUser;

      return firebaseUser?.toFlashCardUser();
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

  @override
  Future<void> deleteAccount() async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        throw Exception('No user is currently signed in');
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google Sign In Canceled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await currentUser.reauthenticateWithCredential(credential);

      await currentUser.delete();

      await signOutWithGoogle();
    } catch (e) {
      throw Exception('Failed to delete account: ${e.toString()}');
    }
  }

  @override
  FlashCardUser? getCurrentUser() {
    final currentUser = _firebaseAuth.currentUser;

    return currentUser?.toFlashCardUser();
  }
}
