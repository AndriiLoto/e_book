import 'package:flutter/material.dart';

class Book {
  final String imageName;
  Book(this.imageName);
}

class CategoryBuilder extends StatelessWidget {
  final String? categoryName;
  CategoryBuilder({this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '$categoryName',
                style: const TextStyle(
                    fontFamily: 'e-Ukraine', color: Colors.white, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: (() {}),
              child: Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'e-Ukraine',
                  color: Colors.grey[500],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              // ignore: prefer_const_constructors
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('assets/images/BookCover.jpg')),
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
