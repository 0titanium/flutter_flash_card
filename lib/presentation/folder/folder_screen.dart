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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            title: Text(
              folderModel.folderData.name,
              style: const TextStyle(fontSize: 24),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(width: 1),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('로그인 / 회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
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
                child: InkWell(
                  onTap: () {
                    context.go(
                      '/folder_list/${folderModel.folderData.name}/add_deck',
                      extra: folderModel.folderData,
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '덱 추가',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Icon(Icons.archive),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: folderModel.decks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onLongPress: () {
                      folderModel.showHiddenButtons(index);
                    },
                    onTap: () {
                      if (folderModel.isLongPressed[index] == true) {
                        folderModel.showHiddenButtons(index);
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
                                    onPressed: () {},
                                    icon: const Icon(Icons.mode_edit),
                                  ),
                                  IconButton(
                                    onPressed: () {},
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
