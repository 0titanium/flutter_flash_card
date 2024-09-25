import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/deck/deck_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddCardDialog extends StatefulWidget {
  const AddCardDialog({super.key});

  @override
  State<AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  @override
  Widget build(BuildContext context) {
    final deckModel = context.watch<DeckModel>();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('카드 작성'),
              subtitle: SizedBox(
                child: Column(
                  children: [
                    TextField(
                      controller: deckModel.cardFrontController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: '앞면',
                      ),
                    ),
                    TextField(
                      controller: deckModel.cardBackController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: '뒷면',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    deckModel.createCard();
                    context.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  child: const Text('생성'),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: const Text('취소'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
