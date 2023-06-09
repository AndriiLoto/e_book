import 'package:e_book/notifiers/app_notifier.dart';

import 'package:e_book/screens/profileScreen.dart';
import 'package:e_book/screens/reset_passwords_screen.dart';
import 'package:e_book/screens/sign_in_page.dart';
import 'package:e_book/screens/sign_up_page.dart';
import 'package:e_book/services/firebase_stream.dart';

import 'package:e_book/widgets/main_page_widget.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.white),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[900],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[700]),
        ),
        routes: {
          FirebaseStream.routeName: (context) => const FirebaseStream(),
          LogInPage.routeName: (context) => LogInPage(),
          MainPage.routeName: (_) => const MainPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          ProfileScreen.routName: (context) => const ProfileScreen(),
          ResetPasswordScreen.routeName: (context) =>
              const ResetPasswordScreen()
        },
        initialRoute: FirebaseStream.routeName,
      ),
    );
  }
}
