import 'package:e_book/widgets/category_buttons.dart';
import 'package:e_book/widgets/my_books.dart';
import 'package:e_book/widgets/recently_added.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: const Text(
            'Welcome to Ebook',
            style: TextStyle(fontFamily: 'GloriaHallelujah-Regular'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(18.5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      MyBooks(),
                      SizedBox(
                        width: 10,
                      ),
                      MyBooks(),
                      SizedBox(
                        width: 10,
                      ),
                      MyBooks(),
                      SizedBox(
                        width: 10,
                      ),
                      MyBooks(),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontFamily: 'GloriaHallelujah-Regular',
                      color: Colors.white),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: CategoryButtons(
                          categoryName: 'Short Stories',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: CategoryButtons(
                          categoryName: 'Science Fiction',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: CategoryButtons(
                          categoryName: 'Action & Adventure',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11.0),
                child: Text(
                  'Recently Added',
                  style: TextStyle(
                      fontFamily: 'GloriaHallelujah-Regular',
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecentlyAdded(),
                      RecentlyAdded(),
                      RecentlyAdded()
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
