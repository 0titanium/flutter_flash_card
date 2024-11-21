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
    final homeModel = context.watch<HomeScreenModel>();
    final flashCardBottomModel = context.watch<FlashCardBottomModel>();

    return Scaffold(
      appBar: const FlashCardAppBar(appBarTitle: '플래시카드'),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(height: 1.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  '최근 방문한 폴더',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              InkWell(
                onTap: () {
                  homeModel.showAllHiddenButtons();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 4.0),
                      Text('기록 관리'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(height: 1.0),
          ),
          homeModel.savedFolders.isEmpty
              ? const Text('최근 방문한 폴더가 없습니다')
              : Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: homeModel.savedFolders.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            flashCardBottomModel.setIndex(1);
                            context.go(
                              '/folder_list/:${homeModel.savedFolders[index].name}',
                              extra: homeModel.savedFolders[index],
                            );
                          },
                          title: Text(homeModel.savedFolders[index].name),
                          trailing: homeModel.isEditing[index]
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            homeModel.deleteVisitedFolder(
                                                homeModel.savedFolders[index]);
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : null,
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
