import 'package:flutter/material.dart';
import 'package:e_book/models/book.dart';

class RecentlyAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.black,
        onTap: () {},
        child: SizedBox(
          height: 150.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    Book().imageName,
                  ),
                ),
              ),
              const SizedBox(
                width: 19.0,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Material(
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
                    SizedBox(
                      height: 5,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Author Name',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                            fontFamily: 'e-Ukraine'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'A book description is a short summary of a book\'s story or content that is designed to “hook” a reader and lead to a sale.  ',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                        fontFamily: 'e-Ukraine',
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
