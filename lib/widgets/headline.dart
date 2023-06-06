import '../screens/book_list.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  Headline({Key? key, required this.category, required this.showAll})
      : super(key: key);

  String category;
  String showAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style:
                const TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookList(name: showAll)));
            },
            child: const Text(
              "See All",
              style: TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
            ),
          )
        ],
      ),
    );
  }
}
