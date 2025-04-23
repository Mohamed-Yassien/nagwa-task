import '../../domain/entities/book_entity.dart';
import 'author_mode.dart';

class BookModel extends BookEntity {
  const BookModel({
    required super.title,
    required super.coverImage,
    required super.summary,
    required super.authors,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json['title'],
        coverImage: json['formats']["image/jpeg"],
        summary: json['summaries'],
        authors: List<AuthorModel>.from(
          json['authors'].map(
            (author) => AuthorModel.fromJson(author),
          ),
        ),
      );
}

