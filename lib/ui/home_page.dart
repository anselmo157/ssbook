import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'SS',
              style: TextStyle(color: Color(0xFF555555)),
            ),
            Text(
              'BOOK',
              style: TextStyle(color: Color(0xFFA076F2)),
            ),
          ],
        ),
        actions: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(),
          ),
        ],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(size.width * 0.1, 32.0),
          ),
        ),
      ),
    );
  }
}
