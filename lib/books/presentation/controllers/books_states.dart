import '../../domain/entities/book_entity.dart';

abstract class BooksStates {}

class BooksInitialState extends BooksStates {}

class GetBooksLoadingState extends BooksStates {}
class GetBooksLoadingMoreState extends BooksStates {}

class GetBooksSuccessState extends BooksStates {
  final List<BookEntity> booksList;

  GetBooksSuccessState({
    required this.booksList,
  });
}

class GetBooksErrorState extends BooksStates {
  final String errorMessage;

  GetBooksErrorState({
    required this.errorMessage,
  });
}
