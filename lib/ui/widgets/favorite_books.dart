import 'package:flutter/material.dart';

class FavoriteBookItem extends StatelessWidget {
  final String url;
  final String name;
  final String author;

  const FavoriteBookItem({
    required this.url,
    required this.name,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      width: 136,
      child: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: [
          Container(
            width: 136,
            height: 198,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
              ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
