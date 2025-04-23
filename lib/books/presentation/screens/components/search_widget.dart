
import 'package:flutter/material.dart';

import '../../controllers/books_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
    required this.cubit,
  });

  final TextEditingController searchController;
  final BooksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) {
                cubit.page = 1;
                cubit.getBooks(
                  search: value,
                );
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              cubit.page = 1;
              cubit.getBooks(
                search: searchController.text,
              );
            },
            icon: CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
