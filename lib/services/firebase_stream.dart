import 'package:e_book/screens/sign_in_page.dart';
import 'package:e_book/screens/verifyEmailScreen.dart';
import 'package:e_book/widgets/main_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirebaseStream extends StatelessWidget {
  static const routeName = 'FirebaseStream';
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const VerifyEmailScreen();
          }
          return const MainPage();
        } else {
          return const MainPage();
        }
      },
    );
  }
}
