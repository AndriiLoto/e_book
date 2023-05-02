import 'package:e_book/screens/home_page.dart';
import 'package:e_book/screens/sign_up_page.dart';
import 'package:e_book/widgets/main_page_widget.dart';

import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  static const routeName = 'LogInPage';
  @override
  State<LogInPage> createState() => _LogInPagePageState();
}

class _LogInPagePageState extends State<LogInPage> {
  final _eMailTextConroller = TextEditingController(text: 'admin');
  final _passwordTextConroller = TextEditingController(text: 'admin');

  String? errorText = null;

  void _logIn() {
    final eMail = _eMailTextConroller.text;
    final password = _passwordTextConroller.text;
    if (eMail == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed(MainPage.routeName);
    } else {
      errorText = 'Incorrect E-mail or password';
    }
    setState(() {});
  }

  void _signUp() {
    Navigator.of(context).pushNamed(SignUpPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;

    return Scaffold(
      backgroundColor: Colors.black,
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
                    child: TextField(
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
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextField(
                      controller: _passwordTextConroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(150),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(150),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'e-Ukraine'),
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
                            onPressed: /* () {
                              Navigator.of(context).pushNamed(HomePage.routeName);
                            } */
                                _logIn,
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
          const Text(
            'Don\'t have an account? Create one for free!',
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
                        _signUp,
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey[700],
                        elevation: 7.5,
                        backgroundColor: Colors.white60,
                        foregroundColor: Colors.black),
                    child: const Text('Sign Up'),
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
