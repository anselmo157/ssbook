import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color primaryColor = Color(0xFF555555);
    const Color secondaryColor = Color(0xFFA076F2);

    return Scaffold(
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
          controller: controller,
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
          onTap: (value) {
            if (value == 1) {
              controller.animateTo(0);
            }
          },
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(size.width * 0.1, 32.0),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Container(
            child: Text('1'),
          ),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: secondaryColor,
        unselectedItemColor: const Color(0xFF9E9E9E),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(
              Icons.home,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Adicionar',
            tooltip: 'Adicionar',
            icon: Icon(
              Icons.add_circle,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Buscar',
            icon: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(
              Icons.favorite,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
