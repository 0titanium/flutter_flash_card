import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/deck/deck_model.dart';
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
              // context.go(
              //   '/folder_list/${deckModel.data[0]}/${deckModel.data[1].deckName}/add_card',
              //   extra: [],
              // );
            },
            icon: const Icon(Icons.edit_square),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            TextField(
                              controller: deckModel.cardFrontController,
                              decoration: const InputDecoration(
                                labelText: '앞면',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: deckModel.cardBackController,
                              decoration: const InputDecoration(
                                labelText: '뒷면',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              deckModel.createCard();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                            ),
                            child: const Icon(Icons.add, size: 32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: deckModel.cards.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(deckModel.cards[index].frontText),
                    subtitle: Text(deckModel.cards[index].backText),
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
