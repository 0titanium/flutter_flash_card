import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
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
    final path = GoRouter.of(context).routerDelegate.currentConfiguration.uri;

    return SafeArea(
      child: Scaffold(
        appBar: FlashCardAppBar(appBarTitle: deckModel.deckData.deckName),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '카드 보기',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: deckModel.inOrder,
                            groupValue: deckModel.willChangeOrder,
                            onChanged: (String? value) {
                              deckModel.changeOrder(value);
                            },
                          ),
                          const Text('순서대로'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: deckModel.inRandomOrder,
                            groupValue: deckModel.willChangeOrder,
                            onChanged: (String? value) {
                              deckModel.changeOrder(value);
                            },
                          ),
                          const Text('랜덤하게'),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            context.go('$path/view_card',
                                extra: deckModel.deckDetails);
                          },
                          icon: const Icon(Icons.view_carousel)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: deckModel.cardFrontController,
                            decoration: const InputDecoration(
                              hintText: '앞면',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: deckModel.cardBackController,
                            decoration: const InputDecoration(
                              hintText: '뒷면',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          deckModel.createCard();
                          FocusScope.of(context).unfocus();
                        },
                        iconSize: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: deckModel.cards.length,
                itemBuilder: (context, index) {
                  return deckModel.isEditing[index]
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller:
                                            deckModel.editFrontController,
                                        decoration: const InputDecoration(
                                          hintText: '앞면',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      TextField(
                                        controller:
                                            deckModel.editBackController,
                                        decoration: const InputDecoration(
                                          hintText: '뒷면',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          deckModel.editCard(
                                              deckModel.cards[index].id);
                                          FocusScope.of(context).unfocus();
                                          deckModel.showEditingMode(index);
                                          deckModel.showHiddenButtons(index);
                                        },
                                        iconSize:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.cancel),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          deckModel.showEditingMode(index);
                                          deckModel.showHiddenButtons(index);
                                        },
                                        iconSize:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: GestureDetector(
                            onLongPress: () {
                              deckModel.showHiddenButtons(index);
                            },
                            onTap: () {
                              if (deckModel.isLongPressed[index] == true) {
                                deckModel.showHiddenButtons(index);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        deckModel.cards[index].frontText,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        deckModel.cards[index].backText,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  if (deckModel.isLongPressed[index])
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                deckModel
                                                    .showEditingMode(index);
                                              },
                                              icon: const Icon(Icons.mode_edit),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                deckModel.deleteCard(
                                                    deckModel.cards[index].id);
                                                deckModel
                                                    .showHiddenButtons(index);
                                              },
                                              icon: const Icon(Icons.delete),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
