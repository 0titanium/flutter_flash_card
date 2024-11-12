import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flash_card/domain/model/flash_card_user.dart';

extension ToFlashCardUser on User {
  FlashCardUser toFlashCardUser() {
    return FlashCardUser(
      id: uid,
      email: email ?? '',
      displayName: displayName ?? '',
    );
  }
}
