import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nagwa/core/app_constants.dart';
import 'package:nagwa/core/network/dio_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'books/domain/entities/author_entity.dart';
import 'books/domain/entities/book_entity.dart';
import 'books/domain/entities/books_reponse_entity.dart';
import 'core/services/service_locator.dart';
import 'books/presentation/screens/books_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServiceLocator().init();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(AuthorEntityAdapter());
  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(BooksResponseEntityAdapter());
  await Hive.openBox<AuthorEntity>(kAuthorBoxKey);
  await Hive.openBox<BookEntity>(kBookBoxKey);
  await Hive.openBox<BooksResponseEntity>(kBooksReponseBoxKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const BooksScreen(),
    );
  }
}
