import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:provider/provider.dart';

class SignInBottomSheet extends StatelessWidget {
  const SignInBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final flashCardAuthProvider = context.watch<FlashCardAuthProvider>();
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '로그인',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    flashCardAuthProvider.signInWithGoogle();
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/android_dark_rd_ctn@1x.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
