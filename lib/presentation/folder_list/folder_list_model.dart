import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/data_source/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderListModel extends ChangeNotifier {
  final DataService _dataService;
  final TextEditingController folderNameController = TextEditingController();

  final Map<String, TextEditingController> _editFolderControllers = {};

  List<Folder> _folders = [];

  List<bool> _isLongPressed = [];

  List<bool> _isEditing = [];

  bool _isShowAll = false;

  List<Folder> get folders => _folders;

  List<bool> get isLongPressed => _isLongPressed;

  List<bool> get isEditing => _isEditing;

  FolderListModel({
    required DataService dataService,
  }) : _dataService = dataService {
    loadFolders();
  }

  TextEditingController getEditFolderController(String folderId) {
    if (!_editFolderControllers.containsKey(folderId)) {
      final folder = _folders.firstWhere((folder) => folder.id == folderId);
      _editFolderControllers[folderId] =
          TextEditingController(text: folder.name);
    }

    return _editFolderControllers[folderId]!;
  }

  Future<void> loadFolders() async {
    final rootFolder = await _dataService.loadRootFolder();

    debugPrint(rootFolder.toString());

    _folders = List.from(rootFolder.subFolders);

    _isLongPressed = List.filled(_folders.length, false);
    _isEditing = List.filled(_folders.length, false);

    notifyListeners();

    debugPrint(folders.toString());
  }

  Future<void> createFolder() async {
    final folderName = folderNameController.text.trim();

    if (folderName == '') {
      throw const FormatException('empty name');
    }

    try {
      Folder? rootFolder = await _dataService.loadRootFolder();

      rootFolder = await _dataService.addFolder(rootFolder, folderName);

      if (rootFolder == null) {
        throw const FormatException('not found folder');
      }

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
    final folderNameController = _editFolderControllers[folderId];

    if (folderNameController == null) {
      return;
    }

    final newFolderName = folderNameController.text.trim();

    if (newFolderName.isEmpty) {
      throw const FormatException('empty name');
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

          _isEditing[folderIndex] = false;

          folderNameController.dispose();

          _editFolderControllers.remove(folderId);

          debugPrint('Folder edited: ${_folders[folderIndex]}');

          _dataService.updateVisitedFolders(_folders);

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
        if (_editFolderControllers.containsKey(folderId)) {
          _editFolderControllers[folderId]!.dispose();
          _editFolderControllers.remove(folderId);
        }

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

  void showAllHiddenButtons() {
    _isShowAll = !_isShowAll;
    _isLongPressed = List.filled(_folders.length, _isShowAll);

    notifyListeners();
  }

  void showHiddenButtons(int index) {
    _isLongPressed[index] = !_isLongPressed[index];
    notifyListeners();
  }

  void showEditingMode(int index) {
    _isEditing[index] = !_isEditing[index];
    notifyListeners();
  }

  void _clearControllers() {
    for (final controller in _editFolderControllers.values) {
      controller.dispose();
    }

    _editFolderControllers.clear();
  }

  @override
  void dispose() {
    folderNameController.dispose();
    _clearControllers();
    super.dispose();
  }
}
