import 'package:e_book/sign_in_page.dart';
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
      home: const BookHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class BookHomePage extends StatelessWidget {
  const BookHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}
