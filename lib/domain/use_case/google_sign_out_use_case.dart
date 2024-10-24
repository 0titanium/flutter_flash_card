import 'package:flutter_flash_card/domain/repository/auth_repository.dart';

class GoogleSignOutUseCase {
  final AuthRepository _authRepository;

  GoogleSignOutUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.signOutWithGoogle();
  }
}
