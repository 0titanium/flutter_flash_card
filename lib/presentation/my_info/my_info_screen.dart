import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_app_bar/flash_card_app_bar.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_model.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:flutter_flash_card/presentation/sign_in/sign_in_bottom_sheet.dart';
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

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: const FlashCardAppBar(appBarTitle: '내 정보'),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: '백업'),
                  Tab(text: '계정'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SizedBox(
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
                                  flashCardAuthProvider.flashCardUser?.id !=
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: TextButton(
                                                onPressed: () {
                                                  myInfoModel.loadBackUpList();
                                                },
                                                child:
                                                    const Text('최근 저장 일자 확인')),
                                          ),
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('로그인 하세요'),
                                        ),
                                  if (myInfoModel.backUpList.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(myInfoModel.backUpList.first),
                                    )
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (flashCardAuthProvider.flashCardUser != null) {
                                _showConfirmationDialogs(context, '클라우드에 저장');
                              } else {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (context) =>
                                      const SignInBottomSheet(),
                                );
                              }
                            },
                            child: const Text('클라우드에 저장하기'),
                          ),
                          TextButton(
                            onPressed: () {
                              _showConfirmationDialogs(context, '저장한 데이터 삭제');
                            },
                            child: const Text('저장한 데이터 삭제'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: flashCardAuthProvider.flashCardUser == null
                            ? TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (context) =>
                                        const SignInBottomSheet(),
                                  );
                                },
                                child: const Text('로그인 하세요'))
                            : TextButton(
                                onPressed: () {
                                  _showConfirmationDialogs(context, '계정 탈퇴');
                                },
                                child: const Text('계정 탈퇴'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialogs(context, String dialogType) {
    final flashCardAuthProvider =
        Provider.of<FlashCardAuthProvider>(context, listen: false);
    final myInfoModel = Provider.of<MyInfoModel>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('확인'),
          content: Text('$dialogType 하시겠습니까?'),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (dialogType == '클라우드에 저장') {
                    myInfoModel.uploadToCloud();
                    Navigator.pop(context);
                    return;
                  }

                  if (dialogType == '저장한 데이터 삭제') {
                    myInfoModel.deleteBackUpData();
                    Navigator.pop(context);
                    return;
                  }

                  if (dialogType == '계정 탈퇴') {
                    flashCardAuthProvider.deleteAccount();
                    Navigator.pop(context);
                  }
                },
                child: const Text('예')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('아니오')),
          ],
        );
      },
    );
  }
}
