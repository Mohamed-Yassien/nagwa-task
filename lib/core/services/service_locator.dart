import 'package:get_it/get_it.dart';

import '../../books/data/datasource/books_datasource.dart';
import '../../books/data/repository/books_repository.dart';
import '../../books/domain/repository/base_news_repository.dart';
import '../../books/domain/use_cases/get_news_usecase.dart';
import '../../books/presentation/controllers/books_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //CUBITS
    sl.registerLazySingleton<BooksCubit>(
      () => BooksCubit(
        sl(),
      ),
    );

    //USECASES
    sl.registerLazySingleton<GetBooksUseCase>(
      () => GetBooksUseCase(
        sl(),
      ),
    );

    //REPOSITIRY
    sl.registerLazySingleton<BaseBooksRepository>(
      () => BooksRepository(
        sl(),
      ),
    );

    //DATASOURCES
    sl.registerLazySingleton<BaseBooksDataSource>(
      () => BooksDataSource(),
    );
  }
}
