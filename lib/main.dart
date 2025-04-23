import 'package:flutter/material.dart';
import 'package:nagwa/core/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/service_locator.dart';
import 'books/presentation/screens/books_screen.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  DioHelper.init();
  ServiceLocator().init();
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
