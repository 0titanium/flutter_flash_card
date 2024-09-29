import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text(
          '플래시 카드',
          style: TextStyle(fontSize: 32),
        ),
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
              child: const Text('로그인'),
            ),
          ),
        ],
      ),
    );
  }
}
