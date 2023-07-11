import 'package:flutter/material.dart';
import 'package:ssbook/models/book_model.dart';
import 'package:ssbook/ui/widgets/favorite_book_item.dart';

class FavoriteBook extends StatelessWidget {
  final List<BookModel> favoriteBook;

  const FavoriteBook({
    required this.favoriteBook,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF555555);
    const Color secondaryColor = Color(0xFFA076F2);

    return Column(
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
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int index = 0; index < favoriteBook.length; index++)
                FavoriteBookItem(
                  url: favoriteBook[index].cover,
                  name: favoriteBook[index].name,
                  author: favoriteBook[index].author,
                  isLast: (index == favoriteBook.length - 1),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
