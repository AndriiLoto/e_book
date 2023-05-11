import 'dart:async';

import 'package:e_book/widgets/main_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/snack_bar_service.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    print(isEmailVerified);

    if (isEmailVerified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));

      setState(() => canResendEmail = true);
    } catch (e) {
      print(e);
      if (mounted) {
        SnackBarService.showSnackBar(
          context,
          '$e',
          true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const MainPage()
      : Scaffold(
          backgroundColor: Colors.grey[900],
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            centerTitle: true,
            title: const Text(
              'E-mail Verification',
              style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 20),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'The confirmation email has been sent to your email address.',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'e-Ukraine',
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                    icon: const Icon(Icons.email, color: Colors.black),
                    label: const Text(
                      'Resend',
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'e-Ukraine'),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      timer?.cancel();
                      await FirebaseAuth.instance.currentUser!.delete();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
