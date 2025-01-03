import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:flutter_flash_card/presentation/sign_in/sign_in_bottom_sheet.dart';
import 'package:provider/provider.dart';

class FlashCardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const FlashCardAppBar({
    super.key,
    required this.appBarTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    final flashCardAuthProvider = context.watch<FlashCardAuthProvider>();

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: flashCardAuthProvider.flashCardUser == null
                ? flashCardAuthProvider.isLoading == false
                    ? TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(width: 1),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) => const SignInBottomSheet(),
                          );
                        },
                        child: const Text('로그인 / 회원가입'),
                      )
                    : const CircularProgressIndicator()
                : flashCardAuthProvider.isLoading == false
                    ? TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(width: 1),
                          ),
                        ),
                        onPressed: () {
                          _showSignOutConfirmationDialog(context);
                        },
                        child: Text(
                            '${flashCardAuthProvider.flashCardUser?.displayName} 로그아웃'),
                      )
                    : const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  void _showSignOutConfirmationDialog(context) {
    final flashCardAuthProvider =
        Provider.of<FlashCardAuthProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('확인'),
          content: const Text('로그아웃 하시겠습니까?'),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  flashCardAuthProvider.signOutWithGoogle();
                  Navigator.pop(context);
                },
                child: const Text(
                  '로그아웃',
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
                  '취소',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        );
      },
    );
  }
}
