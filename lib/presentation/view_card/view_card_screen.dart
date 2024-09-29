import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/flip_card/flip_card.dart';
import 'package:flutter_flash_card/presentation/view_card/view_card_model.dart';
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

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView.builder(
          controller: viewCardModel.pageController,
          itemCount: viewCardModel.cards.length,
          physics: const ClampingScrollPhysics(),
          padEnds: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: FlipCard(
                      frontWidget: ColoredBox(
                        color: Colors.primaries[index % Colors.primaries.length]
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
                        color: Colors.primaries[index % Colors.primaries.length]
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
            );
          },
        ),
      ),
    );
  }
}
