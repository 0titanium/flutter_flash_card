import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/folder/folder_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddDeckDialog extends StatefulWidget {
  const AddDeckDialog({super.key});

  @override
  State<AddDeckDialog> createState() => _AddDeckDialogState();
}

class _AddDeckDialogState extends State<AddDeckDialog> {
  @override
  Widget build(BuildContext context) {
    final folderModel = context.watch<FolderModel>();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('덱 이름'),
              subtitle: SizedBox(
                child: TextField(
                  controller: folderModel.deckNameController,
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
                    folderModel.createDeck();
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
