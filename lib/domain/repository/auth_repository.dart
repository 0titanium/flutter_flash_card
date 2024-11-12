import 'package:flutter_flash_card/domain/model/flash_card_user.dart';

abstract interface class AuthRepository {
  Future<FlashCardUser?> signInWithGoogle();
  Future<void> signOutWithGoogle();
  Future<void> deleteAccount();
  FlashCardUser? getCurrentUser();
}