import 'package:flutter/material.dart';
import 'package:ssbook/models/author_model.dart';
import 'package:ssbook/ui/widgets/favorite_author_item.dart';

class FavoriteAuthor extends StatelessWidget {
  final List<AuthorModel> favoriteAuthor;

  const FavoriteAuthor({
    required this.favoriteAuthor,
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
                'Autores favoritos',
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
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int index = 0; index < favoriteAuthor.length; index++)
                FavoriteAuthorItem(
                  url: favoriteAuthor[index].picture,
                  name: favoriteAuthor[index].name,
                  booksCount: favoriteAuthor[index].booksCount,
                  isLast: (index == favoriteAuthor.length - 1),
                ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
