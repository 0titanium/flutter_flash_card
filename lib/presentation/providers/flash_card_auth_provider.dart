import 'package:flutter/material.dart';
import 'package:flutter_flash_card/domain/model/flash_card_user.dart';
import 'package:flutter_flash_card/domain/use_case/firebase_auth_delete_acoount_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/get_current_user_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_in_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_out_use_case.dart';

class FlashCardAuthProvider extends ChangeNotifier {
  final GoogleSignInUseCase _googleSignInUseCase;
  final GoogleSignOutUseCase _googleSignOutUseCase;
  final FirebaseAuthDeleteAccountUseCase _firebaseAuthDeleteAccountUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FlashCardUser? _flashCardUser;
  bool _isLoading = false;
  String? _error;

  FlashCardUser? get flashCardUser => _flashCardUser;

  bool get isLoading => _isLoading;

  String? get error => _error;

  FlashCardAuthProvider({
    required GoogleSignInUseCase googleSignInUseCase,
    required GoogleSignOutUseCase googleSignOutUseCase,
    required FirebaseAuthDeleteAccountUseCase firebaseAuthDeleteAccountUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  })  : _googleSignInUseCase = googleSignInUseCase,
        _googleSignOutUseCase = googleSignOutUseCase,
        _firebaseAuthDeleteAccountUseCase = firebaseAuthDeleteAccountUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase {
    getCurrentUser();
  }

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

  Future<void> deleteAccount() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _flashCardUser = null;
      await _firebaseAuthDeleteAccountUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getCurrentUser() {
    try {
      _isLoading = true;
      _error = null;

      _flashCardUser = _getCurrentUserUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
