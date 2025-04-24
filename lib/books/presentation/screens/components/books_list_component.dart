import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/services/service_locator.dart';
import '../../controllers/books_cubit.dart';
import '../../controllers/books_states.dart';
import 'book_item.dart';
import 'get_load_more_widget_based_on_state.dart';
import 'search_widget.dart';

class BooksListComponent extends StatefulWidget {
  const BooksListComponent({
    super.key,
  });

  @override
  State<BooksListComponent> createState() => _BooksListComponentState();
}

class _BooksListComponentState extends State<BooksListComponent> {
  final ScrollController scrollController = ScrollController();

  TextEditingController searchController = TextEditingController();

  void scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      context.read<BooksCubit>().page++;
      context.read<BooksCubit>().getBooks(
            search: searchController.text,
          );
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksStates>(
      builder: (context, state) {
        var cubit = sl<BooksCubit>();
        return state is GetBooksLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is GetBooksErrorState
                ? Center(
                    child: Text(state.errorMessage),
                  )
                : Column(
                    children: [
                      SearchWidget(
                        searchController: searchController,
                        cubit: cubit,
                      ),
                      if (MediaQuery.sizeOf(context).width < 600) ...[
                        Expanded(
                          child: ListView.separated(
                            controller: scrollController,
                            padding: const EdgeInsets.all(15),
                            itemBuilder: (context, index) {
                              var cubit = context.read<BooksCubit>();
                              if (index == cubit.booksList.length) {
                                return GetLoadMoreWidgetBasedOnState(
                                  pageState: state,
                                );
                              }
                              var item = cubit.booksList[index];
                              return BookItem(item: item);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: cubit.booksList.length + 1,
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: MasonryGridView.count(
                            padding: const EdgeInsets.all(15),
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            itemCount: cubit.booksList.length + 1,
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              var cubit = context.read<BooksCubit>();
                              if (index == cubit.booksList.length) {
                                return GetLoadMoreWidgetBasedOnState(
                                  pageState: state,
                                  inGridl: true,
                                );
                              }
                              var item = cubit.booksList[index];
                              return BookItem(item: item);
                            },
                          ),
                        ),
                      ],
                    ],
                  );
      },
    );
  }
}
