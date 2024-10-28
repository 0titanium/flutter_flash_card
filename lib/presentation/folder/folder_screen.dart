import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
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
      appBar: FlashCardAppBar(appBarTitle: folderModel.folderData.name),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '덱 추가',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                            child: TextField(
                              controller: folderModel.deckNameController,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        folderModel.createDeck();
                      },
                      icon: const Icon(Icons.archive),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: folderModel.decks.length,
              itemBuilder: (context, index) {
                return folderModel.isEditing[index]
                    ? Card(
                        child: ListTile(
                          title: TextField(
                            controller: folderModel.editDeckController,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      folderModel.editDeckName(
                                          folderModel.decks[index].id);
                                      FocusScope.of(context).unfocus();
                                      folderModel.showEditingMode(index);
                                      folderModel.showHiddenButtons(index);
                                    },
                                    icon: const Icon(Icons.mode_edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      folderModel.showEditingMode(index);
                                      folderModel.showHiddenButtons(index);
                                    },
                                    icon: const Icon(Icons.cancel),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Card(
                        child: ListTile(
                          onLongPress: () {
                            folderModel.showHiddenButtons(index);
                          },
                          onTap: () {
                            if (folderModel.isLongPressed[index] == true) {
                              folderModel.showHiddenButtons(index);
                              return;
                            }
                            context.go(
                              '/folder_list/${folderModel.folderData.name}/${folderModel.decks[index].deckName}',
                              extra: folderModel.decks[index],
                            );
                          },
                          title: Text(folderModel.decks[index].deckName),
                          trailing: folderModel.isLongPressed[index]
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            folderModel.showEditingMode(index);
                                          },
                                          icon: const Icon(Icons.mode_edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            folderModel.deleteDeck(
                                              folderModel.decks[index].id,
                                            );
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
