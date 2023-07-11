import 'package:ssbook/models/book_model.dart';
import 'package:ssbook/models/model.dart';

class AuthorModel implements Model {
  final int id;
  final String name;
  final String picture;
  final String booksCount;
  final bool isFavorite;
  final List<BookModel>? books;

  AuthorModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.booksCount,
    required this.isFavorite,
    this.books,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'booksCount': booksCount,
      'isFavorite': isFavorite,
      'books': books,
    };
  }

  @override
  String toString() {
    return 'AuthorModel{id: $id, name: $name, picture: $picture, booksCount: $booksCount, isFavorite: $isFavorite, books: $books}';
  }
}
