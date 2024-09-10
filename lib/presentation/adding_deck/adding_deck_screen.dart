import 'package:flutter/material.dart';

class AddingDeckScreen extends StatefulWidget {
  const AddingDeckScreen({super.key});

  @override
  State<AddingDeckScreen> createState() => _AddingDeckScreenState();
}

class _AddingDeckScreenState extends State<AddingDeckScreen> {
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
                  subtitle: SizedBox(child: TextField()),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),

                  ),
                  child: const Text('생성'),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                TextButton(
                  onPressed: () {},
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
