import 'package:ssbook/models/model.dart';

class BookModel implements Model {
  final int id;
  final String name;
  final String author;
  final String cover;
  final String? description;
  final bool isFavorite;
  final String? category;

  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.cover,
    this.description,
    required this.isFavorite,
    this.category,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'cover': cover,
      'description': description,
      'isFavorite': isFavorite,
      'category': category,
    };
  }

  @override
  String toString() {
    return 'BookModel{id: $id, name: $name, author: $author, cover: $cover, description: $description, isFavorite: $isFavorite, category: $category}';
  }
}
