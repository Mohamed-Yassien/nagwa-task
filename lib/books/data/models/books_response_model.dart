import 'package:nagwa/books/data/models/book_model.dart';
import 'package:nagwa/books/domain/entities/books_reponse_entity.dart';

class BooksResponseModel extends BooksResponseEntity {
  const BooksResponseModel({
    super.next,
    required super.books,
  });

  factory BooksResponseModel.fromJson(Map<String, dynamic> json) =>
      BooksResponseModel(
        next: json['next'],
        books: List<BookModel>.from(
          json['results'].map(
            (author) => BookModel.fromJson(author),
          ),
        ),
      );
}
