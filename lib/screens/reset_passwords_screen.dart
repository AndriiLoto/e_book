import 'package:e_book/widgets/main_page_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/snack_bar_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = 'ResetPasswordScreen';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailTextInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextInputController.dispose();

    super.dispose();
  }

  Future<void> resetPassword() async {
    final navigator = Navigator.of(context);
    final scaffoldMassager = ScaffoldMessenger.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found') {
        SnackBarService.showSnackBar(
          context,
          'E-mail not found',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Unknown error,please try again or contact customer support',
          true,
        );
        return;
      }
    }

    const snackBar = SnackBar(
      content: Text('Password is changed,check your E-mail'),
      backgroundColor: Colors.green,
    );

    scaffoldMassager.showSnackBar(snackBar);

    navigator.pushNamedAndRemoveUntil(
        MainPage.routeName, (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    _emailTextInputController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Password Reset',
          style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: _emailTextInputController,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter the right E-mail'
                        : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter E-Mail',
                  hintStyle: TextStyle(
                    fontFamily: 'e-Ukraine',
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (_emailTextInputController.text.isEmpty)
                    ? null
                    : resetPassword,
                child: const Center(
                  child: Text(
                    'Resset Password',
                    style:
                        TextStyle(fontFamily: 'e-Ukraine', color: Colors.black),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
