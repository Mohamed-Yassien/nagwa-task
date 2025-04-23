import 'package:dartz/dartz.dart';
import 'package:nagwa/books/domain/entities/books_reponse_entity.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/server_exception.dart';
import '../../domain/repository/base_news_repository.dart';
import '../../domain/use_cases/get_news_usecase.dart';
import '../datasource/books_datasource.dart';

class BooksRepository extends BaseBooksRepository {
  final BaseBooksDataSource baseNewsDataSource;

  BooksRepository(this.baseNewsDataSource);

  @override
  Future<Either<Failure, BooksResponseEntity>> getBooks({
    required FetchBooksParameters parameters,
  }) async {
    final response = await baseNewsDataSource.getBooks(
      parameters: parameters,
    );
    try {
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }
}
