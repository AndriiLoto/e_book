import 'package:e_book/screens/search_screen.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../widgets/category_books/adventure.dart';
import '../widgets/category_books/anime_books.dart';
import '../widgets/category_books/horror.dart';
import '../widgets/category_books/novel.dart';
import '../widgets/category_books/popular.dart';
import '../widgets/headline.dart';
import 'book_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Search for Books",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Most Popular',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'e-ukraine',
                        fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookList(name: "Fiction"),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'e-ukraine',
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: height / 5.3,
                //height: constraints.maxHeight * 0.38,
                margin: const EdgeInsets.only(left: 16),
                child: const PopularBooks(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.white,
            ),
            Headline(
              category: "Anime",
              showAll: "Anime",
            ),
            SizedBox(
              height: height / 3.4,
              child: const AnimeBooks(),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.white,
            ),
            Headline(
              category: "Action & Adventure",
              showAll: "Action & Adventure",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: height / 3.4,
              child: const AdevntureBooks(),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.white,
            ),
            Headline(
              category: "Novel",
              showAll: "Novel",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: height / 3.4,
              child: const NovelBooks(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.white,
            ),
            Headline(
              category: "Horror",
              showAll: "Horror",
            ),
            SizedBox(
              //color: Colors.yellow,
              height: height / 3.4,
              child: const HorrorBooks(),
            ),
          ],
        ),
      ),
    );
  }
}
