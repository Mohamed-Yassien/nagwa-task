
abstract class BooksStates {}

class BooksInitialState extends BooksStates {}

class GetBooksLoadingState extends BooksStates {}
class GetBooksLoadingMoreState extends BooksStates {}

class GetBooksSuccessState extends BooksStates {

}

class GetBooksErrorState extends BooksStates {
  final String errorMessage;

  GetBooksErrorState({
    required this.errorMessage,
  });
}
class GetBooksLoadMoreErrorState extends BooksStates {
  final String errorMessage;

  GetBooksLoadMoreErrorState({
    required this.errorMessage,
  });
}
