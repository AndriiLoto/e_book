import 'package:e_book/screens/profileScreen.dart';
import 'package:e_book/screens/sign_in_page.dart';
import 'package:e_book/screens/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser;
  void checkUser() {
    if (user == null) {
      Navigator.of(context).pushReplacementNamed(LogInPage.routeName);
    } else {
      Navigator.of(context).pushNamed(ProfileScreen.routName);
    }
  }

  List items = [];
  @override
  void initState() {
    items = [
      {
        'icon': Icons.favorite_border,
        'title': 'Favorites',
        'function': () {},
      },
      {
        'icon': Icons.download,
        'title': 'Downloads',
        'function': () {},
      },
      {
        'icon': Icons.person,
        'title': 'Profile',
        'function': checkUser,
      },
      {
        'icon': Icons.info_outline,
        'title': 'About',
        'function': () {},
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 20),
        ),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: items[index]['function'],
              leading: Icon(
                items[index]['icon'],
              ),
              title: Text(
                items[index]['title'],
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider(
              color: Colors.grey[800],
              thickness: 1,
            );
          }),
          itemCount: 4),
    );
  }
}
