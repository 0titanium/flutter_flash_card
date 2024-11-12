import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:flutter_flash_card/domain/repository/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository _authRepository;

  GoogleSignInUseCase(this._authRepository);

  Future<FlashCardUser?> execute() async {
    return await _authRepository.signInWithGoogle();
  }
}
