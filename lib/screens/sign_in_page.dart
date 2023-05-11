import 'package:e_book/screens/home_page.dart';
import 'package:e_book/screens/reset_passwords_screen.dart';
import 'package:e_book/screens/sign_up_page.dart';
import 'package:e_book/widgets/main_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../services/snack_bar_service.dart';

class LogInPage extends StatefulWidget {
  static const routeName = 'LogInPage';
  @override
  State<LogInPage> createState() => _LogInPagePageState();
}

class _LogInPagePageState extends State<LogInPage> {
  bool isHiddenPassword = true;
  final _eMailTextConroller = TextEditingController();
  final _passwordTextConroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? errorText = null;

  @override
  void dispose() {
    _eMailTextConroller.dispose();
    _passwordTextConroller.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {});
    isHiddenPassword = !isHiddenPassword;
  }

  Future<void> _logIn() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _eMailTextConroller.text.trim(),
        password: _passwordTextConroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Wrong e-mail or password!Please try again!',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Unknown error,please contact customer support',
          true,
        );
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil(
        MainPage.routeName, (Route<dynamic> route) => false);
  }

  void _signUp() {
    Navigator.of(context).pushNamed(SignUpPage.routeName);
  }

  void _resetPassword() {
    Navigator.of(context).pushNamed(
      ResetPasswordScreen.routeName,
    );
  }

  @override
  void initState() {
    _eMailTextConroller.addListener(() {
      setState(() {});
    });
    _passwordTextConroller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 30,
                          fontFamily: 'e-Ukraine'),
                      'Sign In'),
                  const Padding(padding: EdgeInsets.all(10)),
                  if (errorText != null) ...[
                    Text(
                      '$errorText',
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 10,
                          fontFamily: 'e-Ukraine'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                  ],
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: _eMailTextConroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                              ),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'e-Ukraine'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          TextFormField(
                            validator: (value) =>
                                value != null && value.length < 5
                                    ? 'Password must contain 5 characters'
                                    : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autocorrect: false,
                            controller: _passwordTextConroller,
                            obscureText: isHiddenPassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffix: InkWell(
                                onTap: togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'e-Ukraine'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        /* const SizedBox(
                          width: 10,
                        ), */
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (_eMailTextConroller.text.isEmpty ||
                                    _passwordTextConroller.text.isEmpty)
                                ? null
                                : _logIn,
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.grey[700],
                                elevation: 7.5,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                            child: const Text('Sign In'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: 'e-Ukraine'),
              ),
              const Text(
                'Forgot your password?',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: 'e-Ukraine'),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: /* () {
                                    Navigator.of(context).pushNamed(HomePage.routeName);
                                  } */
                        _signUp,
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey[700],
                        elevation: 7.5,
                        backgroundColor: Colors.white60,
                        foregroundColor: Colors.black),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontFamily: 'e-Ukraine'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: /* () {
                                    Navigator.of(context).pushNamed(HomePage.routeName);
                                  } */
                        _resetPassword,
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey[700],
                        elevation: 7.5,
                        backgroundColor: Colors.white60,
                        foregroundColor: Colors.black),
                    child: const Text(
                      'Resset Password',
                      style: TextStyle(fontFamily: 'e-Ukraine'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
