import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  String? categoryName;
  CategoryButtons({this.categoryName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      onTap: () {},
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '$categoryName',
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'e-Ukraine'),
          ),
        ),
      ),
    );
  }
}
