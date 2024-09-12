import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/add_folder/add_folder_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddFolderScreen extends StatefulWidget {
  const AddFolderScreen({super.key});

  @override
  State<AddFolderScreen> createState() => _AddFolderScreenState();
}

class _AddFolderScreenState extends State<AddFolderScreen> {
  @override
  Widget build(BuildContext context) {
    final addFolderModel = context.watch<AddFolderModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('폴더 추가'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                child: ListTile(
                  title: const Text('폴더 이름'),
                  subtitle: SizedBox(
                      child: TextField(
                    controller: addFolderModel.folderNameController,
                    autofocus: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                  )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.go('/card_list/card_deck');
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
