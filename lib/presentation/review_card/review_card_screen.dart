import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/flip_card/flip_card.dart';
import 'package:flutter_flash_card/presentation/review_card/review_card_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReviewCardScreen extends StatefulWidget {
  const ReviewCardScreen({super.key});

  @override
  State<ReviewCardScreen> createState() => _ReviewCardScreenState();
}

class _ReviewCardScreenState extends State<ReviewCardScreen> {
  @override
  Widget build(BuildContext context) {
    final reviewCardModel = context.watch<ReviewCardModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: reviewCardModel.pageController,
            itemCount: reviewCardModel.reviewCards.length + 1,
            physics: const ClampingScrollPhysics(),
            padEnds: true,
            itemBuilder: (context, index) {
              if (index == reviewCardModel.reviewCards.length) {
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
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text(
                                      '이전으로 돌아가기',
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
                                      reviewCardModel
                                          .reviewCards[index].frontText,
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
                                      reviewCardModel
                                          .reviewCards[index].backText,
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
