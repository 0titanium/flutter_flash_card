import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:go_router/go_router.dart';
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
                      context.go('/sign_in');
                    },
                    child: const Text('로그인 / 회원가입'),
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(width: 1),
                      ),
                    ),
                    onPressed: () {
                      flashCardAuthProvider.signOutWithGoogle();
                    },
                    child: Text(
                        '${flashCardAuthProvider.flashCardUser?.displayName} 로그아웃'),
                  ),
          ),
        ],
      ),
    );
  }
}
