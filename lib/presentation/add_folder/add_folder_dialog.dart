import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/add_folder/add_folder_model.dart';
import 'package:flutter_flash_card/presentation/folder_list/folder_list_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddFolderDialog extends StatefulWidget {
  const AddFolderDialog({super.key});

  @override
  State<AddFolderDialog> createState() => _AddFolderDialogState();
}

class _AddFolderDialogState extends State<AddFolderDialog> {
  @override
  Widget build(BuildContext context) {
    final folderListModel = context.watch<FolderListModel>();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('폴더 이름'),
              subtitle: SizedBox(
                child: TextField(
                  controller: folderListModel.folderNameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    folderListModel.createFolder();
                    context.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  child: const Text('생성'),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: const Text('취소'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
