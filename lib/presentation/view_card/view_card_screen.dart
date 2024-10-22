import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/flip_card/flip_card.dart';
import 'package:flutter_flash_card/presentation/view_card/view_card_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ViewCardScreen extends StatefulWidget {
  const ViewCardScreen({super.key});

  @override
  State<ViewCardScreen> createState() => _ViewCardScreenState();
}

class _ViewCardScreenState extends State<ViewCardScreen> {
  @override
  Widget build(BuildContext context) {
    final viewCardModel = context.watch<ViewCardModel>();
    final String folderName =
        GoRouterState.of(context).pathParameters['folderName'] ?? '';
    final String deckName =
        GoRouterState.of(context).pathParameters['deckName'] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: viewCardModel.pageController,
            itemCount: viewCardModel.cards.length + 1,
            physics: const ClampingScrollPhysics(),
            padEnds: true,
            itemBuilder: (context, index) {
              if (index == viewCardModel.cards.length) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Container(
                                color: Colors.grey.withOpacity(0.3),
                                child: const Center(
                                  child: Text(
                                    '모르는 것만 다시 보기',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      context.go(
                                          '/folder_list/$folderName/$deckName/review_card',
                                          extra: viewCardModel.cardsForReview);
                                    },
                                    child: const Text(
                                      'O',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text(
                                      'X',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: FlipCard(
                              frontWidget: ColoredBox(
                                color: Colors
                                    .primaries[index % Colors.primaries.length]
                                    .withOpacity(0.5),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      viewCardModel.cards[index].frontText,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              backWidget: ColoredBox(
                                color: Colors
                                    .primaries[index % Colors.primaries.length]
                                    .withOpacity(0.3),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      viewCardModel.cards[index].backText,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    viewCardModel.checkIsKnown(
                                      viewCardModel.deckDetails['deckId'],
                                      viewCardModel.cards[index].id,
                                      true,
                                    );
                                  },
                                  child: const Text(
                                    'O',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    viewCardModel.checkIsKnown(
                                      viewCardModel.deckDetails['deckId'],
                                      viewCardModel.cards[index].id,
                                      false,
                                    );
                                  },
                                  child: const Text(
                                    'X',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
