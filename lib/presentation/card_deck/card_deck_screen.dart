import 'package:flutter/material.dart';

class CardDeckScreen extends StatefulWidget {
  const CardDeckScreen({super.key});

  @override
  State<CardDeckScreen> createState() => _CardDeckScreenState();
}

class _CardDeckScreenState extends State<CardDeckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('덱 이름'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Text('카드 추가'),
              leading: const Icon(Icons.add),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
