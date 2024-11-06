import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_model.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:go_router/go_router.dart';
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(
                            '최근 저장 일자',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                      flashCardAuthProvider.flashCardUser?.id != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: myInfoModel.backUpList.isEmpty
                                    ? const Text('최근 저장 내역이 없습니다.')
                                    : Text(myInfoModel.backUpList.first),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('로그인 하세요'),
                            ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (flashCardAuthProvider.flashCardUser != null) {
                    myInfoModel.uploadToCloud();
                  } else {
                    context.go('/sign_in');
                  }
                },
                child: const Text('클라우드에 저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
