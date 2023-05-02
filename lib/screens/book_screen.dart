import 'package:e_book/models/book.dart';
import 'package:e_book/widgets/category_buttons.dart';
import 'package:e_book/widgets/recently_added.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookScreenWidget extends StatefulWidget {
  static const routeName = 'BookPage';
  BookScreenWidget({super.key});

  @override
  State<BookScreenWidget> createState() => _BookScreenWidgetState();
}

class _BookScreenWidgetState extends State<BookScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: (() {}), icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: (() {}), icon: const Icon(Icons.ios_share_outlined)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.5),
                      child: Image.asset(Book().imageName),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Material(
                            type: MaterialType.transparency,
                            child: Text(
                              'The Title of Book',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'e-Ukraine'),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Material(
                            type: MaterialType.transparency,
                            child: Text(
                              Book().authoreName,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey,
                                  fontFamily: 'e-Ukraine'),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: const Text('Category'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextButton(
                                  child: const Text(
                                    'Read Book',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Book Description',
                      style: TextStyle(
                          fontFamily: 'e-Ukraine',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.6,
                      height: 25.5,
                    ),
                    const Text(
                      'A book description is a short summary of a book\'s story or content that is designed to “hook” a reader and lead to a sale.  ',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey, fontFamily: 'e-Ukraine'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'show more',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'e-Ukraine'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'More Books',
                    style: TextStyle(
                        fontFamily: 'e-Ukraine',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.2,
                    height: 25.5,
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              prototypeItem: RecentlyAdded(),
              itemBuilder: (context, index) {
                return RecentlyAdded();
              },
            ),
          ],
        ),
      ),
    );
  }
}
