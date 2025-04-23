import 'package:equatable/equatable.dart';

import 'authot_entity.dart';

class BookEntity extends Equatable {
  final String title, coverImage;
  final List<dynamic> summary;
  final List<AuthorEntity> authors;

  const BookEntity({
    required this.title,
    required this.coverImage,
    required this.summary,
    required this.authors,
  });

  @override
  List<Object?> get props => [
        title,
        coverImage,
        summary,
        authors,
      ];
}


