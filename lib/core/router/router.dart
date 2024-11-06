import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/data/remote/back_up_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom.dart';
import 'package:flutter_flash_card/presentation/components/flash_card_bottom/flash_card_bottom_model.dart';
import 'package:flutter_flash_card/presentation/deck/deck_model.dart';
import 'package:flutter_flash_card/presentation/deck/deck_screen.dart';
import 'package:flutter_flash_card/presentation/folder/folder_model.dart';
import 'package:flutter_flash_card/presentation/folder/folder_screen.dart';
import 'package:flutter_flash_card/presentation/folder_list/folder_list_model.dart';
import 'package:flutter_flash_card/presentation/folder_list/folder_list_screen.dart';
import 'package:flutter_flash_card/presentation/home/home_screen.dart';
import 'package:flutter_flash_card/presentation/home/home_screen_model.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_model.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_screen.dart';
import 'package:flutter_flash_card/presentation/review_card/review_card_model.dart';
import 'package:flutter_flash_card/presentation/review_card/review_card_screen.dart';
import 'package:flutter_flash_card/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_flash_card/presentation/view_card/view_card_model.dart';
import 'package:flutter_flash_card/presentation/view_card/view_card_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/sign_in',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        return const SignInScreen();
      },
    ),
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
              create: (_) => HomeScreenModel(dataService: DataService()),
              child: const HomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/folder_list',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => FolderListModel(dataService: DataService()),
              child: const FolderListScreen(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: ':folderName',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => FolderModel(
                    folderData: state.extra as Folder,
                    dataService: DataService(),
                  ),
                  child: const FolderScreen(),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                  path: ':deckName',
                  builder: (context, state) {
                    return ChangeNotifierProvider(
                      create: (_) => DeckModel(
                        deckData: state.extra as Deck,
                        dataService: DataService(),
                      ),
                      child: const DeckScreen(),
                    );
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'view_card',
                      builder: (context, state) {
                        return ChangeNotifierProvider(
                          create: (_) => ViewCardModel(
                            deckDetails: state.extra as Map<String, dynamic>,
                            dataService: DataService(),
                          ),
                          child: const ViewCardScreen(),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'review_card',
                      builder: (context, state) {
                        return ChangeNotifierProvider(
                          create: (_) => ReviewCardModel(
                            reviewCards: state.extra as List<LearningCard>,
                          ),
                          child: const ReviewCardScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/my_info',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => MyInfoModel(
                  backUpService: BackUpService(),
                  firebaseAuth: FirebaseAuth.instance),
              child: const MyInfoScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
