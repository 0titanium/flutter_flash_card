import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom.dart';
import 'package:flutter_flash_card/presentation/home/home_screen_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenModel = context.watch<HomeScreenModel>();

    return Scaffold(
      body: homeScreenModel.screens[homeScreenModel.currentPageIndex],
      bottomNavigationBar: FlashCardBottom(
        currentPageIndex: homeScreenModel.currentPageIndex,
        onIndexSelected: homeScreenModel.onIndexSelected,
      ),
    );
  }
}
