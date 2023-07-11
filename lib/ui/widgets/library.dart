import 'package:flutter/material.dart';
import 'package:ssbook/models/book_model.dart';
import 'package:ssbook/ui/widgets/category_item.dart';
import 'package:ssbook/ui/widgets/library_item.dart';

class Library extends StatelessWidget {
  final List<BookModel> books;

  const Library({
    required this.books,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biblioteca',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF555555),
            ),
          ),
          Container(
            height: 32.0,
            margin: const EdgeInsets.only(top: 20.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryItem(
                  category: 'Todos',
                  backgroundColor: Color(0xFFA076F2),
                  textColor: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                CategoryItem(
                  category: 'Romance',
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF757575),
                ),
                SizedBox(
                  width: 10.0,
                ),
                CategoryItem(
                  category: 'Aventura',
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF757575),
                ),
                SizedBox(
                  width: 10.0,
                ),
                CategoryItem(
                  category: 'Comédia',
                  backgroundColor: Colors.white,
                  textColor: Color(0xFF757575),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: (90.0 * books.length),
            child: ListView(
              children: [
                for (int index = 0; index < books.length; index++)
                  LibraryItem(
                    url: books[index].cover,
                    name: books[index].name,
                    author: books[index].author,
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
