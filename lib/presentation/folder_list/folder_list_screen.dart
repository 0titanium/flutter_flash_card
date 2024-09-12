import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FolderListScreen extends StatefulWidget {
  const FolderListScreen({super.key});

  @override
  State<FolderListScreen> createState() => _FolderListScreenState();
}

class _FolderListScreenState extends State<FolderListScreen> {
  @override
  Widget build(BuildContext context) {
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
                context.go('/folder_list/adding_card_deck');
              },
            ),
          )
        ],
      ),
    );
  }
}
