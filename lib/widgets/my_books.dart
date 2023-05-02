import 'package:e_book/screens/book_screen.dart';
import 'package:flutter/material.dart';

class MyBooks extends StatelessWidget {
  const MyBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() =>
          Navigator.of(context).pushNamed(BookScreenWidget.routeName)),
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        height: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/BookCover.jpg')),
      ),
    );
  }
}
