import 'package:flutter/material.dart';

class FlashCardBottom extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onIndexSelected;

  const FlashCardBottom({
    super.key,
    required this.currentPageIndex,
    required this.onIndexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: onIndexSelected,
      indicatorColor: Colors.green,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: '홈'),
        NavigationDestination(icon: Icon(Icons.folder_rounded), label: '카드'),
        NavigationDestination(icon: Icon(Icons.person), label: '내 정보'),
      ],
    );
  }
}
