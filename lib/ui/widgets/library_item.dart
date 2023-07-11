import 'package:flutter/material.dart';

class LibraryItem extends StatelessWidget {
  final String url;
  final String name;
  final String author;

  const LibraryItem({
    required this.url,
    required this.name,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 70,
      width: MediaQuery.of(context).size.width - 40.0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              url,
              width: 48.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 5.0,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: 240.0,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF555555),
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 180.0,
                  child: Text(
                    author,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
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
