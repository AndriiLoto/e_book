import 'package:e_book/widgets/home_page.dart';

import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  static const routeName = 'LogInPage';
  @override
  State<LogInPage> createState() => _LogInPagePageState();
}

class _LogInPagePageState extends State<LogInPage> {
  final _eMailTextConroller = TextEditingController();

  final _passwordTextConroller = TextEditingController();

  String? errorText = null;

  void _logIn() {
    final eMail = _eMailTextConroller.text;
    final password = _passwordTextConroller.text;
    if (eMail == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      errorText = 'Incorrect E-mail or password';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 30,
                  fontFamily: 'e-Ukraine'),
              'Log In'),
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
          TextField(
            controller: _eMailTextConroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(150),
                ),
              ),
              labelText: 'E-mail',
              labelStyle: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'e-Ukraine'),
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
          const Padding(padding: EdgeInsets.only(top: 15)),
          TextField(
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
                  color: Colors.white, fontSize: 20, fontFamily: 'e-Ukraine'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
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
                  child: const Text('Log In'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
