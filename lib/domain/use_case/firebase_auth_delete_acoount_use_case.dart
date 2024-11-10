import 'package:flutter_flash_card/domain/repository/auth_repository.dart';

class FirebaseAuthDeleteAccountUseCase {
  final AuthRepository _authRepository;

  FirebaseAuthDeleteAccountUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.deleteAccount();
  }
}