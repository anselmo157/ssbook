import 'package:flutter/material.dart';

class FavoriteAuthorItem extends StatelessWidget {
  final String url;
  final String name;
  final int booksCount;
  final bool isLast;

  const FavoriteAuthorItem({
    required this.url,
    required this.name,
    required this.booksCount,
    required this.isLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: isLast ? 20 : 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: 250,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              url,
              width: 63.0,
              height: 67.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 5.0,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: 156,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF555555),
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    '$booksCount livros',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
