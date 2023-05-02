import 'package:e_book/screens/book_screen.dart';
import 'package:e_book/screens/sign_in_page.dart';
import 'package:e_book/screens/sign_up_page.dart';

import 'package:e_book/widgets/main_page_widget.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[900],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700]),
      ),
      routes: {
        LogInPage.routeName: (context) => LogInPage(),
        MainPage.routeName: (_) => const MainPage(),
        BookScreenWidget.routeName: (_) => BookScreenWidget(),
        SignUpPage.routeName: (context) => SignUpPage(),
      },
      initialRoute: LogInPage.routeName,
    );
  }
}
