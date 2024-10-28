import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
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
      appBar: const FlashCardAppBar(appBarTitle: '폴더 목록'),
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
                        '폴더 추가',
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
                              controller: folderListModel.folderNameController,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        folderListModel.createFolder();
                      },
                      icon: const Icon(Icons.create_new_folder),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: folderListModel.folders.length,
              itemBuilder: (context, index) {
                return folderListModel.isEditing[index]
                    ? Card(
                        child: ListTile(
                          title: TextField(
                            controller: folderListModel.editFolderController,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      folderListModel.editFolderName(
                                          folderListModel.folders[index].id);
                                      FocusScope.of(context).unfocus();
                                      folderListModel.showEditingMode(index);
                                      folderListModel.showHiddenButtons(index);
                                    },
                                    icon: const Icon(Icons.mode_edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      folderListModel.showEditingMode(index);
                                      folderListModel.showHiddenButtons(index);
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
                            folderListModel.showHiddenButtons(index);
                          },
                          onTap: () {
                            if (folderListModel.isLongPressed[index] == true) {
                              folderListModel.showHiddenButtons(index);
                              return;
                            }
                            context.go(
                              '/folder_list/:${folderListModel.folders[index].name}',
                              extra: folderListModel.folders[index],
                            );
                          },
                          title: Text(folderListModel.folders[index].name),
                          trailing: folderListModel.isLongPressed[index]
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            folderListModel
                                                .showEditingMode(index);
                                          },
                                          icon: const Icon(Icons.mode_edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            folderListModel.deleteFolder(
                                              folderListModel.folders[index].id,
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
