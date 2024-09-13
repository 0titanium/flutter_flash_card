import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class AddFolderModel extends ChangeNotifier {
  final DataService _dataService;
  final TextEditingController folderNameController = TextEditingController();

  AddFolderModel({
    required DataService dataService,
  }) : _dataService = dataService;

  Future<void> createFolder() async {
    final folderName = folderNameController.text.trim();

    if (folderName == '') {
      return;
    }

    try {
      Folder rootFolder = await _dataService.loadRootFolder();

      _dataService.addFolder(rootFolder, folderName);

      await _dataService.saveRootFolder(rootFolder);
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  @override
  void dispose() {
    folderNameController.dispose();
    super.dispose();
  }
}
