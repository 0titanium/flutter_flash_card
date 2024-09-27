import 'package:flutter/material.dart';
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
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: CarouselView(
          itemExtent: 330,
          shrinkExtent: 200,
          children: List<Widget>.generate(
            viewCardModel.cards.length,
            (int index) {
              return ColoredBox(
                color: Colors.primaries[index % Colors.primaries.length]
                    .withOpacity(0.5),
                child: Center(
                  child: Text(
                    viewCardModel.cards[index].frontText,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.clip,
                    softWrap: false,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
