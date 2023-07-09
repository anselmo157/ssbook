import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color primaryColor = Color(0xFF555555);
    const Color secondaryColor = Color(0xFFA076F2);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Text(
                'SS',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 33,
                  fontFamily: 'BebasNeue',
                ),
              ),
              Text(
                'BOOK',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 33,
                  fontFamily: 'BebasNeue',
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: secondaryColor,
            indicatorWeight: 4,
            padding: EdgeInsets.only(left: 20, right: size.width * 0.3),
            tabs: const [
              Tab(
                child: Text(
                  'Meus livros',
                  style: TextStyle(color: primaryColor, fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  'Emprestados',
                  style: TextStyle(color: primaryColor, fontSize: 14),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(size.width * 0.1, 32.0),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text('1'),
            ),
            const Center(
              child: Text(
                'Em progresso...',
                style: TextStyle(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
