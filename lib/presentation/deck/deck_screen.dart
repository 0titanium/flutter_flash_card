import 'package:flutter/material.dart';
import 'package:flutter_flash_card/core/router/router.dart';
import 'package:flutter_flash_card/presentation/deck/deck_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DeckScreen extends StatefulWidget {
  const DeckScreen({super.key});

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  @override
  Widget build(BuildContext context) {
    final deckModel = context.watch<DeckModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card list'),
        actions: [
          IconButton(
            onPressed: () {
              // debugPrint(deckModel.folderAndDeckData.toString());
              context.go(
                '/folder_list/${deckModel.data[0]}/${deckModel.data[1].deckName}/add_card',
                extra: [],
              );
            },
            icon: const Icon(Icons.edit_square),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: deckModel.cards.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              // title: Text(deckModel.cards[index].front),
              onTap: () {
                // context.go(
                //   '/folder_list/folder/:${folderModel.decks[index].deckName}',
                //   extra: [
                //     folderModel.decks[index].deckName,
                //     folderModel.decks[index].id,
                //   ],
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
