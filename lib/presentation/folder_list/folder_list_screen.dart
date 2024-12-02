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
                        title: const Text('폴더 추가'),
                        content: TextField(
                          controller: folderListModel.folderNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: '폴더명을 입력하세요',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              folderListModel.createFolder();
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
                      Icon(Icons.create_new_folder),
                      SizedBox(width: 4.0),
                      Text('폴더 추가'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  folderListModel.showAllHiddenButtons();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 4.0),
                      Text('폴더 관리'),
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
              itemCount: folderListModel.folders.length,
              itemBuilder: (context, index) {
                return folderListModel.isEditing[index]
                    ? Card(
                        child: ListTile(
                          title: TextField(
                            controller: folderListModel.getEditFolderController(
                                folderListModel.folders[index].id),
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
