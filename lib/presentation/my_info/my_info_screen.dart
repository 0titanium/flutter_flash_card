import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_model.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:provider/provider.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final flashCardAuthProvider = context.watch<FlashCardAuthProvider>();
    final myInfoModel = context.watch<MyInfoModel>();

    return SafeArea(
      child: Scaffold(
        appBar: const FlashCardAppBar(appBarTitle: '내 정보'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  myInfoModel.uploadToCloud(flashCardAuthProvider.flashCardUser?.id);
                },
                child: Text('클라우드에 저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
