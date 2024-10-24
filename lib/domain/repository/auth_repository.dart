import 'package:flutter_flash_card/domain/model/user.dart';

abstract interface class AuthRepository {
  Future<User> signInWithGoogle();
  Future<void> signOutWithGoogle();
}