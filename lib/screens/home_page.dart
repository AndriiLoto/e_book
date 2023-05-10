import 'package:e_book/widgets/category_buttons.dart';
import 'package:e_book/widgets/my_books.dart';
import 'package:e_book/widgets/recently_added.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: (user == null)
            ? const Text(
                'Welcome to EbooK',
                style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 30),
              )
            : const Text(
                'Welcome Back',
                style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 30),
              ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(18.5),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: (user == null)
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Sign in and see your favorites books',
                            style: TextStyle(
                                fontFamily: 'e-Ukraine',
                                color: Colors.white,
                                fontSize: 19),
                          ),
                        ],
                      )
                    : Row(
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
                style: TextStyle(fontFamily: 'e-Ukraine', color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: CategoryButtons(
                        categoryName: 'Short Stories',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: CategoryButtons(
                        categoryName: 'Science Fiction',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.all(
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
                style: TextStyle(fontFamily: 'e-Ukraine', color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                prototypeItem: RecentlyAdded(),
                itemBuilder: (context, index) {
                  return RecentlyAdded();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
