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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(height: 1.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('덱 추가'),
                        content: TextField(
                          controller: folderModel.deckNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: '덱 명을 입력하세요',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              folderModel.createDeck();
                              Navigator.of(context).pop();
                            },
                            child: const Text('추가'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('취소'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.archive),
                      SizedBox(width: 4.0),
                      Text('덱 추가'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  folderModel.showAllHiddenButtons();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 4.0),
                      Text('덱 관리'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(height: 1.0),
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
                            controller: folderModel.getEditDeckController(
                                folderModel.decks[index].id),
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
