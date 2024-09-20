import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/folder/folder_model.dart';
import 'package:go_router/go_router.dart';
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
        title: Text(folderModel.folderData[0]),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: folderModel.decks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(folderModel.decks[index].deckName),
              onTap: () {
                context.go(
                  '/folder_list/folder/:${folderModel.decks[index].deckName}',
                  extra: [
                    folderModel.decks[index].deckName,
                    folderModel.decks[index].id,
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
