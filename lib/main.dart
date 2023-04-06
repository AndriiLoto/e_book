import 'package:e_book/widgets/home_page.dart';
import 'package:e_book/widgets/sign_in_page.dart';
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
      ),
      routes: {
        LogInPage.routeName: (context) => LogInPage(),
        HomePage.routeName: (_) => HomePage()
      },
      initialRoute: LogInPage.routeName,
    );
  }
}
