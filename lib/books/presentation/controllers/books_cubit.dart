import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/book_entity.dart';
import '../../domain/use_cases/get_news_usecase.dart';
import 'books_states.dart';

class BooksCubit extends Cubit<BooksStates> {
  BooksCubit(this.getNewsUseCase) : super(BooksInitialState());

  static BooksCubit get(context) => BlocProvider.of(context);

  GetBooksUseCase getNewsUseCase;

  List<BookEntity> booksList = [];

  int page = 1;
  String? nextPage;

  Future<void> getBooks({
    String? search,
  }) async {
    if (page == 1) {
      emit(GetBooksLoadingState());
    }else{
      emit(GetBooksLoadingMoreState());
    }
    final response = await getNewsUseCase(
      FetchBooksParameters(
        page: page,
        search: search,
      ),
    );
    response.fold(
      (l) => emit(
        GetBooksErrorState(
          errorMessage: l.message,
        ),
      ),
      (r) {
        nextPage = r.next;
        if (page == 1) {
          booksList = r.books;
        } else {
          booksList.addAll(r.books);
        }
        emit(
          GetBooksSuccessState(
            booksList: r.books,
          ),
        );
      },
    );
  }
}
