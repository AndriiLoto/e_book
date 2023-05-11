import 'package:e_book/screens/reset_passwords_screen.dart';
import 'package:e_book/widgets/main_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routName = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil(
        MainPage.routeName, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your E-mail: ${user?.email}',
              style: const TextStyle(
                  fontFamily: 'e-Ukraine', fontSize: 15, color: Colors.white),
            ),
            TextButton(
              onPressed: () => signOut(),
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            TextButton(
              onPressed: () =>
                  navigator.pushNamed(ResetPasswordScreen.routeName),
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
