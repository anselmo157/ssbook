import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final Color backgroundColor;
  final Color textColor;

  const CategoryItem({
    required this.category,
    required this.backgroundColor,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
