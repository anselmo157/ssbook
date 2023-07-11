import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ssbook/models/author_model.dart';
import 'package:ssbook/models/book_model.dart';
import 'package:ssbook/ui/widgets/favorite_authors.dart';
import 'package:ssbook/ui/widgets/favorite_books.dart';

class ContentHomePage extends StatelessWidget {
  final List<BookModel> books;
  final List<BookModel> favoriteBooks;
  final List<AuthorModel> authors;

  const ContentHomePage({
    required this.books,
    required this.favoriteBooks,
    required this.authors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF555555);
    const Color secondaryColor = Color(0xFFA076F2);

    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Livros favoritos',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'ver todos',
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                return FavoriteBookItem(
                  url: favoriteBooks[index].cover,
                  name: favoriteBooks[index].name,
                  author: favoriteBooks[index].author,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
