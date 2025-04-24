import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'book_entity.dart';
part 'books_reponse_entity.g.dart';

@HiveType(typeId: 2)
class BooksResponseEntity extends Equatable {
  @HiveField(0)
  final String? next;
  @HiveField(1)
  final List<BookEntity> books;

  const BooksResponseEntity({
    this.next,
    required this.books,
  });

  @override
  List<Object?> get props => [
        next,
        books,
      ];
}
