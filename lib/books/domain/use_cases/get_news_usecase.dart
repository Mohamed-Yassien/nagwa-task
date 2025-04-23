import 'package:dartz/dartz.dart';
import 'package:nagwa/books/domain/entities/books_reponse_entity.dart';
import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/base_news_repository.dart';

class GetBooksUseCase
    extends BaseUseCase<BooksResponseEntity, FetchBooksParameters> {
  final BaseBooksRepository baseNewsRepository;

  GetBooksUseCase(this.baseNewsRepository);

  @override
  Future<Either<Failure, BooksResponseEntity>> call(
      FetchBooksParameters parameters) async {
    return await baseNewsRepository.getBooks(
      parameters: parameters,
    );
  }
}

class FetchBooksParameters {
  final String? nextPageUrl, search;
  final int page;

  const FetchBooksParameters({
    this.search,
    this.nextPageUrl,
    required this.page,
  });

  List<Object?> get props => [
        nextPageUrl,
        page,
        search,
      ];
}
