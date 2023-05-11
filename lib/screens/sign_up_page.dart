import 'package:e_book/screens/home_page.dart';
import 'package:e_book/services/firebase_stream.dart';
import 'package:e_book/services/snack_bar_service.dart';
import 'package:e_book/widgets/main_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = 'SignUpPage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHiddenPassword = true;
  final TextEditingController _emailTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextRepeatInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    _emailTextInputController.dispose();
    _passwordTextInputController.dispose();
    _passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  Future<void> _signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (_passwordTextInputController.text !=
        _passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(
        context,
        'Passwords should be the same',
        true,
      );
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextInputController.text.trim(),
        password: _passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'This E-mail is already in use',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Unknown error,please contact customer support',
          true,
        );
      }
    }
    navigator.pushNamedAndRemoveUntil(
      FirebaseStream.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 30,
                          fontFamily: 'e-Ukraine'),
                      'Sign Up'),
                  const Padding(padding: EdgeInsets.all(10)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter the right E-mail'
                                    : null,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            controller: _emailTextInputController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                              ),
                              hintText: 'Enter your E-mail',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'e-Ukraine'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          TextFormField(
                            autocorrect: false,
                            controller: _passwordTextInputController,
                            obscureText: isHiddenPassword,
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                              ),
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(color: Colors.grey),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'e-Ukraine'),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Password must contain 6 characters'
                                    : null,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          TextFormField(
                            autocorrect: false,
                            controller: _passwordTextRepeatInputController,
                            obscureText: isHiddenPassword,
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                              ),
                              hintText: 'Repeat your password',
                              hintStyle: const TextStyle(color: Colors.grey),
                              labelText: 'Repeat your password',
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'e-Ukraine'),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(150),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 5
                                    ? 'Password must contain 6 characters'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ElevatedButton(
                            onPressed: _signUp,
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.grey[700],
                                elevation: 7.5,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                            child: const Text('Sign Up'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Have an account? Sign in now!',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'e-Ukraine'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: /* () {
                                    Navigator.of(context).pushNamed(HomePage.routeName);
                                  } */
                        (() {
                      Navigator.pop(context);
                    }),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey[700],
                        elevation: 7.5,
                        backgroundColor: Colors.white60,
                        foregroundColor: Colors.black),
                    child: const Text('Sign in'),
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
