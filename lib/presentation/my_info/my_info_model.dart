import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/data_source/remote/back_up_service.dart';

class MyInfoModel extends ChangeNotifier {
  Timer? _debounceTimer;

  final BackUpService _backUpService;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  List<String> _backUpList = [];
  bool _isLoading = false;

  List<String> get backUpList => _backUpList;

  MyInfoModel({
    required BackUpService backUpService,
    required firebase_auth.FirebaseAuth firebaseAuth,
  })  : _backUpService = backUpService,
        _firebaseAuth = firebaseAuth {
    loadBackUpList();
  }

  Future<void> loadBackUpList() async {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      _backUpList = await _backUpService.getBackupsList(currentUser.uid);
    }

    notifyListeners();
  }

  Future<void> uploadToCloud() async {
    if (_isLoading) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      _isLoading = true;
      notifyListeners();

      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        await _backUpService.backupToFirestore(currentUser.uid);
        await loadBackUpList();
      }
      debugPrint('---upload---');

      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> deleteBackUpData() async {
    if (_isLoading) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      _isLoading = true;
      notifyListeners();

      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        await _backUpService.deleteBackups(currentUser.uid);
        _backUpList = [];
      }

      notifyListeners();

      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
