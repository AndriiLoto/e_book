import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: const Text(
            'Welcome to Ebook',
            style: TextStyle(fontFamily: 'GloriaHallelujah-Regular'),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [Text('Row 1')],
            ),
            Text('Categories'),
            Row(
              children: [Text('Row 1')],
            ),
            Text('Recently Added'),
            Column(
              children: [Text('Column')],
            )
          ],
        ));
  }
}
