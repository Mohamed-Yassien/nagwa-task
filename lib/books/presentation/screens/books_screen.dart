import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../controllers/books_cubit.dart';
import 'components/books_list_component.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BooksCubit>()..getBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Books APP',
          ),
          centerTitle: true,
        ),
        body: const BooksListComponent(),
      ),
    );
  }
}
