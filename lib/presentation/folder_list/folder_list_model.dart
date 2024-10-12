import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderListModel extends ChangeNotifier {
  final DataService _dataService;
  final TextEditingController folderNameController = TextEditingController();
  TextEditingController editFolderController = TextEditingController();

  List<Folder> _folders = [];

  List<Folder> get folders => _folders;

  List<bool> _isLongPressed = [];

  List<bool> get isLongPressed => _isLongPressed;

  List<bool> _isEditing = [];

  List<bool> get isEditing => _isEditing;

  FolderListModel({
    required DataService dataService,
  }) : _dataService = dataService {
    loadFolders();
  }

  Future<void> loadFolders() async {
    final rootFolder = await _dataService.loadRootFolder();

    debugPrint(rootFolder.toString());

    _folders = [...rootFolder.subFolders];

    _isLongPressed = List.filled(_folders.length, false);
    _isEditing = List.filled(_folders.length, false);

    notifyListeners();

    debugPrint(folders.toString());
  }

  Future<void> createFolder() async {
    final folderName = folderNameController.text.trim();

    if (folderName == '') {
      return;
    }

    try {
      Folder rootFolder = await _dataService.loadRootFolder();

      rootFolder = _dataService.addFolder(rootFolder, folderName);

      await _dataService.saveRootFolder(rootFolder);

      _folders = [...rootFolder.subFolders];
      _isLongPressed = List.filled(_folders.length, false);
      _isEditing = List.filled(_folders.length, false);

      folderNameController.clear();

      notifyListeners();
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  Future<void> editFolderName(String folderId) async {
    final newFolderName = editFolderController.text.trim();

    if (newFolderName.isEmpty) {
      return;
    }

    try {
      final success =
          await _dataService.editFolderName(folderId, newFolderName);

      if (success) {
        final folderIndex =
            _folders.indexWhere((folder) => folder.id == folderId);
        if (folderIndex != -1) {
          _folders[folderIndex] = _folders[folderIndex].copyWith(
            name: newFolderName,
          );

          _isEditing = List.filled(_folders.length, false);
          debugPrint('Folder edited: ${_folders[folderIndex]}');

          notifyListeners();
        }
      } else {
        debugPrint('Folder not found in local list');
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  Future<void> deleteFolder(String folderId) async {
    try {
      final success = await _dataService.deleteFolder(folderId);

      if (success) {
        _folders.removeWhere((folder) => folder.id == folderId);

        _isLongPressed = List.filled(_folders.length, false);
        _isEditing = List.filled(_folders.length, false);

        notifyListeners();
      } else {
        debugPrint('Failed to delete folder');
      }
    } catch (e) {
      debugPrint('Error deleting folder: $e');
    }
  }

  void showHiddenButtons(int index) {
    _isLongPressed[index] = !_isLongPressed[index];
    notifyListeners();
  }

  void showEditingMode(int index) {
    _isEditing[index] = !_isEditing[index];
    editFolderController = TextEditingController(text: _folders[index].name);
    notifyListeners();
  }

  @override
  void dispose() {
    folderNameController.dispose();
    editFolderController.dispose();
    super.dispose();
  }
}
