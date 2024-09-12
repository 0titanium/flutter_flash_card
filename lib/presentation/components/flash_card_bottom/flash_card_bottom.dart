import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FlashCardBottom extends StatelessWidget {
  const FlashCardBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final flashCardBottomModel = context.watch<FlashCardBottomModel>();

    return NavigationBar(
      onDestinationSelected: (index) {
        flashCardBottomModel.setIndex(index);

        switch (index) {
          case 0:
            {
              context.go('/home');
            }
          case 1:
            {
              context.go('/card_list');
            }
          case 2:
            {
              context.go('/my_info');
            }
        }
      },
      selectedIndex: flashCardBottomModel.selectedIndex,
      indicatorColor: Colors.green,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: '홈'),
        NavigationDestination(icon: Icon(Icons.folder_rounded), label: '폴더'),
        NavigationDestination(icon: Icon(Icons.person), label: '내 정보'),
      ],
    );
  }
}
