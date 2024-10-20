import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom_model.dart';
import 'package:flutter_flash_card/presentation/home/home_screen_model.dart';
import 'package:go_router/go_router.dart';
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
    final flashCardBottomModel = context.watch<FlashCardBottomModel>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            title: const Text(
              '플래시 카드',
              style: TextStyle(fontSize: 24),
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
                  child: const Text('로그인 / 회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: homeScreenModel.savedFolders.isEmpty
          ? const Text('최근 방문한 폴더가 없습니다')
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: homeScreenModel.savedFolders.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      flashCardBottomModel.setIndex(1);
                      context.go(
                        '/folder_list/:${homeScreenModel.savedFolders[index].name}',
                        extra: homeScreenModel.savedFolders[index],
                      );
                    },
                    title: Text(homeScreenModel.savedFolders[index].name),
                  ),
                );
              },
            ),
    );
  }
}
