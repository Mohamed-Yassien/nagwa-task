import 'package:dio/dio.dart';

class DioHelper {
  static Dio mydio = Dio();

  static void init() {
    mydio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  static Future<dynamic> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    mydio.options.baseUrl = url;
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await mydio.get(
      url,
      queryParameters: query,
    );
    return response.data;
  }
}
