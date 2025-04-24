import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../core/app_constants.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/entities/books_reponse_entity.dart';
import '../../domain/use_cases/get_news_usecase.dart';
import 'books_states.dart';

class BooksCubit extends Cubit<BooksStates> {
  BooksCubit(this.getNewsUseCase, this.connectivity)
      : super(BooksInitialState());
  final Connectivity connectivity;

  static BooksCubit get(context) => BlocProvider.of(context);

  GetBooksUseCase getNewsUseCase;

  List<BookEntity> booksList = [];

  int page = 1;
  String? nextPage;

  Future<void> getBooks({
    String? search,
  }) async {
    final box = Hive.box<BooksResponseEntity>(kBooksReponseBoxKey);
    log(box.values.toString());
    final connection = await connectivity.checkConnectivity();
    if (page == 1) {
      emit(GetBooksLoadingState());
    } else {
      emit(GetBooksLoadingMoreState());
    }
    if (connection.first != ConnectivityResult.none) {
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
    } else {
      final cached = box.values.toList();
      if (cached.isNotEmpty) {
        if (cached.length < page) {
          emit(
            GetBooksLoadMoreErrorState(
              errorMessage: 'No more books available',
            ),
          );
          return;
        }
        nextPage = cached[page - 1].next;
        if (page == 1) {
          booksList = cached[page - 1].books;
        } else {
          booksList.addAll(cached[page - 1].books);
        }

        emit(
          GetBooksSuccessState(
            booksList: cached[page - 1].books,
          ),
        );
      } else {
        emit(
          GetBooksErrorState(
            errorMessage: 'No internet connection and no cached data available',
          ),
        );
      }
    }
  }
}
