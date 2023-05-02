import 'package:e_book/widgets/category_builder.dart';

import 'package:flutter/material.dart';

class ExplorePageWidget extends StatelessWidget {
  ExplorePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Explore',
          style: TextStyle(fontFamily: 'e-Ukraine', fontSize: 30),
        ),
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CategoryBuilder(
              categoryName: 'Categoty Name',
            );
          },
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
        ),
      ),
    );
  }
}
