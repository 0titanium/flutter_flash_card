import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/home/home_screen.dart';
import 'package:flutter_flash_card/presentation/home/home_screen_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Card',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeScreenModel(),
        child: const HomeScreen(),
      ),
    );
  }
}
