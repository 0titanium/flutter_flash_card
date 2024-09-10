import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카드 목록'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Text('덱 추가'),
              leading: const Icon(Icons.add),
              onTap: () {
                context.go('/card_list/adding_card_deck');
              },
            ),
          )
        ],
      ),
    );
  }
}
