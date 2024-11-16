import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
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
      appBar: const FlashCardAppBar(appBarTitle: '플래시카드'),
      body: homeScreenModel.savedFolders.isEmpty
          ? const Text('최근 방문한 폴더가 없습니다')
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(height: 1.0),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        '최근 방문한 폴더',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(height: 1.0),
                ),
                Expanded(
                  child: ListView.builder(
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
                ),
              ],
            ),
    );
  }
}
