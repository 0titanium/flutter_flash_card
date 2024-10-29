import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/remote/back_up_service.dart';

class MyInfoModel extends ChangeNotifier {
  final BackUpService _backUpService;

  MyInfoModel({required BackUpService backUpService})
      : _backUpService = backUpService;

  Future<void> uploadToCloud(String? userId) async {
    if (userId != null) {
      await _backUpService.backupToFirestore(userId);
    }
  }
}
