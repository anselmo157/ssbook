import 'package:flutter/material.dart';

class FavoriteBookItem extends StatelessWidget {
  final String url;
  final String name;
  final String author;
  final bool isLast;

  const FavoriteBookItem({
    required this.url,
    required this.name,
    required this.author,
    required this.isLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: isLast ? 20 : 0),
      width: 136,
      child: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              url,
              width: 136.0,
              height: 198.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 136,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF555555),
              ),
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 136,
            child: Text(
              author,
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
    );
  }
}
