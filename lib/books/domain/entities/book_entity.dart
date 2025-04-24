import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'author_entity.dart';
part 'book_entity.g.dart';



@HiveType(typeId: 1)
class BookEntity extends Equatable {
  @HiveField(0)
  final String title;
    @HiveField(1)
  final String coverImage;
  @HiveField(2)
  final List<dynamic> summary;
  @HiveField(3)
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
