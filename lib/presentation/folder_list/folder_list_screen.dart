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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            title: const Text(
              '폴더 목록',
              style: TextStyle(fontSize: 24),
            ),
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
                    context.go('/folder_list/add_folder');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '폴더 추가',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Icon(Icons.create_new_folder),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: folderListModel.folders.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(folderListModel.folders[index].name),
                    onTap: () {
                      context.go(
                        '/folder_list/:${folderListModel.folders[index].name}',
                        extra: folderListModel.folders[index],
                      );
                    },
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
