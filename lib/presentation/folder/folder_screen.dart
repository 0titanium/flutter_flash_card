import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/folder/folder_model.dart';
import 'package:provider/provider.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    final folderModel = context.watch<FolderModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(folderModel.folderName),
        actions: [
          IconButton(
            onPressed: () {
              // context.go('/folder_list/add_folder');
            },
            icon: const Icon(Icons.archive),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Text('카드 추가'),
              leading: const Icon(Icons.add),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
