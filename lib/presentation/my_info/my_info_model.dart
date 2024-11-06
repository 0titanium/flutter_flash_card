import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/remote/back_up_service.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';

class MyInfoModel extends ChangeNotifier {
  final BackUpService _backUpService;
  final FlashCardAuthProvider _flashCardAuthProvider;
  List<String> _backUpList = [];

  List<String> get backUpList => _backUpList;

  MyInfoModel({
    required BackUpService backUpService,
    required FlashCardAuthProvider flashCardAuthProvider,
  })  : _backUpService = backUpService,
        _flashCardAuthProvider = flashCardAuthProvider;

  Future<List<String>> loadBackUpList() async {
    final userId = _flashCardAuthProvider.flashCardUser?.id;

    if (userId != null) {
      _backUpList = await _backUpService.getBackupsList(userId);
    }
    notifyListeners();

    return _backUpList;
  }

  Future<void> uploadToCloud() async {
    final userId = _flashCardAuthProvider.flashCardUser?.id;

    if (userId != null) {
      await _backUpService.backupToFirestore(userId);
      await loadBackUpList();
    }
  }
}
