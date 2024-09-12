import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddingFolderScreen extends StatefulWidget {
  const AddingFolderScreen({super.key});

  @override
  State<AddingFolderScreen> createState() => _AddingFolderScreenState();
}

class _AddingFolderScreenState extends State<AddingFolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('덱 추가'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Card(
                child: ListTile(
                  title: Text('덱 이름'),
                  subtitle: SizedBox(
                      child: TextField(
                    autofocus: true,
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
