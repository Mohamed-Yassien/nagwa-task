import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:nagwa/books/data/models/books_response_model.dart';
import 'package:nagwa/books/domain/use_cases/get_news_usecase.dart';
import 'package:nagwa/core/network/dio_helper.dart';
import '../../../core/app_constants.dart';
import '../../../core/error/error_message_model.dart';
import '../../../core/error/server_exception.dart';
import '../../../core/network/api_constance.dart';
import '../../domain/entities/books_reponse_entity.dart';

abstract class BaseBooksDataSource {
  Future<BooksResponseModel> getBooks({
    required FetchBooksParameters parameters,
  });
}

class BooksDataSource extends BaseBooksDataSource {
  @override
  Future<BooksResponseModel> getBooks({
    required FetchBooksParameters parameters,
  }) async {
    final box = Hive.box<BooksResponseEntity>(kBooksReponseBoxKey);
    final response = await DioHelper.getData(
      url: parameters.nextPageUrl ?? ApiConstance.getBooksUrl,
      query: {
        'page': parameters.page,
        'search': parameters.search,
      },
    );
    if (response != null) {
      await box.add(BooksResponseModel.fromJson(response));
      debugPrint(box.values.toString());
      return BooksResponseModel.fromJson(response);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
