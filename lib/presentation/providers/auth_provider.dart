import 'package:flutter/material.dart';
import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_in_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_out_use_case.dart';

class AuthProvider extends ChangeNotifier {
  final GoogleSignInUseCase _googleSignInUseCase;
  final GoogleSignOutUseCase _googleSignOutUseCase;

  FlashCardUser? _flashCardUser;
  bool _isLoading = false;
  String? _error;

  FlashCardUser? get flashCardUser => _flashCardUser;

  bool get isLoading => _isLoading;

  String? get error => _error;

  AuthProvider({
    required GoogleSignInUseCase googleSignInUseCase,
    required GoogleSignOutUseCase googleSignOutUseCase,
  })  : _googleSignInUseCase = googleSignInUseCase,
        _googleSignOutUseCase = googleSignOutUseCase;

  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _flashCardUser = await _googleSignInUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOutWithGoogle() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _googleSignOutUseCase.execute();
      _flashCardUser = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
