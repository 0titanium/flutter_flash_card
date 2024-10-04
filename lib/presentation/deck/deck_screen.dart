import 'package:flutter/material.dart';
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: AppBar(
              title: Text(
                deckModel.deckData.deckName,
                style: const TextStyle(fontSize: 24),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(width: 1),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('로그인 / 회원가입'),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                                extra: deckModel.cardAndOrder);
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
                        iconSize: 40,
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
                  return Card(
                    child: ListTile(
                      onLongPress: () {
                        deckModel.showHiddenButtons(index);
                      },
                      onTap: () {
                        if (deckModel.isLongPressed[index] == true) {
                          deckModel.showHiddenButtons(index);
                        }
                      },
                      title: Text(deckModel.cards[index].frontText),
                      subtitle: Text(deckModel.cards[index].backText),
                      trailing: deckModel.isLongPressed[index]
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.mode_edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deckModel.deleteCard(
                                            deckModel.cards[index].id);
                                        deckModel.showHiddenButtons(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : null,
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
