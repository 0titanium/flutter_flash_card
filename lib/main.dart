import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flash_card/core/router/router.dart';
import 'package:flutter_flash_card/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_flash_card/domain/use_case/firebase_auth_delete_acoount_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/get_current_user_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_in_use_case.dart';
import 'package:flutter_flash_card/domain/use_case/google_sign_out_use_case.dart';
import 'package:flutter_flash_card/firebase_options.dart';
import 'package:flutter_flash_card/presentation/providers/flash_card_auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final googleSignIn = GoogleSignIn();
  final firebaseAuth = FirebaseAuth.instance;

  final authRepository = AuthRepositoryImpl(googleSignIn, firebaseAuth);

  final googleSignInUseCase = GoogleSignInUseCase(authRepository);
  final googleSignOutUseCase = GoogleSignOutUseCase(authRepository);
  final firebaseAuthDeleteAccountUseCase =
      FirebaseAuthDeleteAccountUseCase(authRepository);
  final getCurrentUserUseCase = GetCurrentUserUseCase(authRepository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => FlashCardAuthProvider(
        googleSignInUseCase: googleSignInUseCase,
        googleSignOutUseCase: googleSignOutUseCase,
        firebaseAuthDeleteAccountUseCase: firebaseAuthDeleteAccountUseCase,
        getCurrentUserUseCase: getCurrentUserUseCase,
      ),
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flash Card',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
