import 'dart:ui';

import 'package:e_book/widgets/home_page.dart';

import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Sign In'),
          const Padding(padding: EdgeInsets.all(10)),
          const TextField(
            decoration: InputDecoration(
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
          const TextField(
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                  child: const Text('I am next page'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
