import 'package:e_book/widgets/category_books/anime_books.dart';
import 'package:e_book/widgets/category_books/popular.dart';
import 'package:e_book/widgets/category_buttons.dart';

import '../notifiers/app_notifier.dart';
import '../models/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/constants.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id, this.boxColor}) : super(key: key);
  var d;
  var id;
  final Color? boxColor;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
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
      backgroundColor: Colors.grey[900],
      body: Consumer<AppNotifier>(
        builder: ((context, value, child) {
          return widget.id != null
              ? FutureBuilder(
                  future: value.showBookData(id: widget.id),
                  builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                    if (snapshot.hasError && snapshot.data == null) {
                      return const Center(
                        child: Text("Opps! Try again later!"),
                      );
                    }
                    if (snapshot.hasData && snapshot.data?.volumeInfo != null) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 206,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.5),
                                      child: Image(
                                        image: NetworkImage(
                                          '${snapshot.data?.volumeInfo?.imageLinks?.thumbnail}',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                              '${snapshot.data?.volumeInfo?.title ?? "Censored"}'
                                                  .toUpperCase(),
                                              style: const TextStyle(
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
                                              '${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}'
                                                  .toUpperCase(),
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
                                            child: Text(
                                              '${snapshot.data?.volumeInfo?.pageCount} Pages',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.grey,
                                                  fontFamily: 'e-Ukraine'),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snapshot.data?.volumeInfo?.categories?[0]}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'e-ukraine',
                                            ),
                                            maxLines: 1,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 11.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: TextButton(
                                                    child: Text(
                                                      'Preview Book Online'
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () async {
                                                      Uri url = Uri.parse(
                                                          "${snapshot.data?.volumeInfo?.previewLink}");
                                                      await launchUrl(url,
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
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
                                  Text(
                                    '${snapshot.data?.volumeInfo?.description} ',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'e-Ukraine'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 30.0),
                                    child: Text(
                                      'Popular Books',
                                      style: TextStyle(
                                          fontFamily: 'e-Ukraine',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                    thickness: 0.6,
                                    height: 25.5,
                                  ),
                                  const SizedBox(
                                    height: 200,
                                    child: PopularBooks(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.grey,
                    ));
                  },
                )
              : const Center(
                  child: Text("Opps No Data Found!"),
                );
        }),
      ),
    );
  }
}
