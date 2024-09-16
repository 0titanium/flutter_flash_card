import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/add_folder/add_folder_dialog.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (context) => AddFolderDialog(),
              // );
              context.go('/folder_list/add_folder');
            },
            icon: const Icon(Icons.create_new_folder),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: folderListModel.folders.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(folderListModel.folders[index].name),
            ),
          );
        },
        // children: [
        //   ...folderListModel.folders.map(
        //     (folder) => Card(
        //       child: ListTile(
        //         title: Text(folder.name),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
