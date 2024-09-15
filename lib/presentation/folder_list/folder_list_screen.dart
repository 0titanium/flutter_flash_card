import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/folder_list/folder_list_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FolderListScreen extends StatefulWidget {
  const FolderListScreen({super.key});

  @override
  State<FolderListScreen> createState() => _FolderListScreenState();
}

class _FolderListScreenState extends State<FolderListScreen> {
  @override
  Widget build(BuildContext context) {
    final folderListModel = context.watch<FolderListModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('폴더 목록'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Text('폴더 추가'),
              leading: const Icon(Icons.add),
              onTap: () {
                context.go('/folder_list/add_folder');
              },
            ),
          ),
          ...folderListModel.folders.map(
            (folder) => Card(
              child: ListTile(
                title: Text(folder.name),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
