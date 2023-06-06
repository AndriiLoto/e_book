import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/detail_screen.dart';
import '../../constant/constants.dart';
import '../../notifiers/app_notifier.dart';
import '../../models/book.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
        future: data.getBookData(),
        builder: (context, AsyncSnapshot<Books> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Opps! Try again later!"),
            );
          }
          if (snapshot.hasData) {
            return LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              id: snapshot.data?.items![index].id,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: constraints.maxWidth * 0.6,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: SizedBox(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth * 0.30,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image(
                                        image: NetworkImage(
                                            "${snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: constraints.maxWidth * 0.03),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Censored"}",
                                      // maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'e-ukraine')
                                          .copyWith(
                                        fontSize: constraints.maxWidth * 0.038,
                                      )),
                                  Text(
                                      "${snapshot.data?.items![index].volumeInfo?.title}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'e-ukraine')
                                          .copyWith(
                                              fontSize: constraints.maxWidth *
                                                  0.048)),
                                  Text(
                                    "${snapshot.data?.items![index].volumeInfo!.categories?.length != 0 ? snapshot.data?.items![index].volumeInfo!.categories![0] : "Unknown"}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'e-ukraine')
                                        .copyWith(
                                            fontSize:
                                                constraints.maxWidth * 0.038),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: constraints.maxHeight * 0.2,
                                    width: constraints.maxWidth * 0.18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      "${snapshot.data?.items![index].volumeInfo?.pageCount ?? "96.9"}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            });
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          ));
        });
  }
}
