import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/models/author_model.dart';
import 'package:ssbook/models/book_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<BookModel> books = [];
  List<AuthorModel> authors = [];

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
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Emprestados',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
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
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          ListView.builder(
            itemBuilder: ((context, index) => Text(
                  index.toString(),
                )),
            itemCount: 100,
          ),
          Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          HttpLink link = HttpLink(
              'https://us-central1-ss-devops.cloudfunctions.net/GraphQL');
          GraphQLClient qlClient = GraphQLClient(
            link: link,
            cache: GraphQLCache(
              store: HiveStore(),
            ),
          );

          getFavoriteAuthors(qlClient: qlClient);
          getAllBooks(qlClient: qlClient);
        },
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

  void getFavoriteAuthors({GraphQLClient? qlClient}) async {
    QueryResult queryResult = await qlClient!.query(
      QueryOptions(
        document: gql('''query {
  favoriteAuthors {
    id
    name
    picture
    booksCount
    isFavorite
  }
}'''),
      ),
    );

    for (int i = 0; i < queryResult.data!['favoriteAuthors'].length; i++) {
      authors.add(
        AuthorModel(
          id: int.parse(
            queryResult.data!['favoriteAuthors'][i]['id'],
          ),
          name: queryResult.data!['favoriteAuthors'][i]['name'],
          picture: queryResult.data!['favoriteAuthors'][i]['picture'],
          booksCount: queryResult.data!['favoriteAuthors'][i]['booksCount'],
          isFavorite: queryResult.data!['favoriteAuthors'][i]['isFavorite'],
        ),
      );
    }
  }

  void getAllBooks({GraphQLClient? qlClient}) async {
    QueryResult queryResult = await qlClient!.query(
      QueryOptions(
        document: gql('''query {
  allBooks {
    id
    name
    author{
      name
    }
    cover
    isFavorite
  }
}'''),
      ),
    );

    for (int i = 0; i < queryResult.data!['allBooks'].length; i++) {
      books.add(
        BookModel(
          id: int.parse(queryResult.data!['allBooks'][i]['id']),
          name: queryResult.data!['allBooks'][i]['name'],
          author: queryResult.data!['allBooks'][i]['author']['name'],
          cover: queryResult.data!['allBooks'][i]['cover'],
          isFavorite: queryResult.data!['allBooks'][i]['isFavorite'],
        ),
      );
    }
  }
}
