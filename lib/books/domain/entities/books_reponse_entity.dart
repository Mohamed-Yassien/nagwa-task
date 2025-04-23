import 'package:equatable/equatable.dart';
import 'book_entity.dart';

class BooksResponseEntity extends Equatable {
  final String? next;
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


