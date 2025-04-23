import 'package:dartz/dartz.dart';
import 'package:nagwa/books/domain/entities/books_reponse_entity.dart';
import '../../../core/error/failure.dart';
import '../use_cases/get_news_usecase.dart';

abstract class BaseBooksRepository {
  Future<Either<Failure, BooksResponseEntity>> getBooks({
      required FetchBooksParameters parameters,
  });
}
