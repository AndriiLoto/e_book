import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Pacifico-Regular'),
              'Sign In'),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(150),
                ),
              ),
              labelText: 'E-mail',
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
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
          Padding(padding: EdgeInsets.only(top: 15)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
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
                  fontFamily: 'Pacifico-Regular'),
            ),
          ),
        ],
      ),
    );
  }
}
