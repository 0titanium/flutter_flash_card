import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/adding_deck/adding_deck_screen.dart';
import 'package:flutter_flash_card/presentation/card_list/card_list_screen.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom_model.dart';
import 'package:flutter_flash_card/presentation/home/home_screen.dart';
import 'package:flutter_flash_card/presentation/home/home_screen_model.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return ChangeNotifierProvider(
          create: (_) => FlashCardBottomModel(),
          child: Scaffold(
            body: child,
            bottomNavigationBar: const FlashCardBottom(),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => HomeScreenModel(),
              child: const HomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/card_list',
          builder: (context, state) => const CardListScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: 'adding_card_deck',
              builder: (context, state) {
                return const AddingDeckScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/my_info',
          builder: (context, state) => const MyInfoScreen(),
        ),
      ],
    ),
  ],
);
