import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      {'icon': Icons.person, 'title': 'Profile', 'function': () {}},
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
