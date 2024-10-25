import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

extension ToUser on GoogleSignInAccount {
  FlashCardUser toUser() {
    return FlashCardUser(
      id: id ?? '',
      email: email ?? '',
      displayName: displayName ?? '',
    );
  }
}
