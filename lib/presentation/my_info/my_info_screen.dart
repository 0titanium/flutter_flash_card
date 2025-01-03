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
                                            child: Text(myInfoModel
                                                    .backUpList.isNotEmpty
                                                ? myInfoModel.backUpList.first
                                                : '저장 기록이 없습니다'),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                ),
                                                builder: (context) =>
                                                    const SignInBottomSheet(),
                                              );
                                            },
                                            child: const Text('로그인 하세요'),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (flashCardAuthProvider.flashCardUser !=
                                    null) {
                                  _showConfirmationDialogs(
                                      context, '클라우드 데이터와 동기화');
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
                              child: const Text('클라우드 데이터와 동기화'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (flashCardAuthProvider.flashCardUser !=
                                    null) {
                                  _showConfirmationDialogs(
                                      context, '저장한 데이터를 삭제');
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
                              child: const Text('저장한 데이터 삭제'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: flashCardAuthProvider.flashCardUser == null
                            ? ElevatedButton(
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
                            : ElevatedButton(
                                onPressed: () {
                                  _showConfirmationDialogs(context, '계정을 탈퇴');
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (dialogType == '클라우드에 저장') {
                    myInfoModel.uploadToCloud();
                    Navigator.pop(context);
                    return;
                  }

                  if (dialogType == '클라우드 데이터와 동기화') {
                    myInfoModel.syncCloudData();
                    Navigator.pop(context);
                    return;
                  }

                  if (dialogType == '저장한 데이터를 삭제') {
                    myInfoModel.deleteBackUpData();
                    Navigator.pop(context);
                    return;
                  }

                  if (dialogType == '계정을 탈퇴') {
                    flashCardAuthProvider.deleteAccount();
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  '예',
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '아니오',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        );
      },
    );
  }
}
