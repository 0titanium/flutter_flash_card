import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            title: const Text(
              '내 정보',
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
                  onPressed: () {
                    context.go('/sign_in');
                  },
                  child: const Text('로그인 / 회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
