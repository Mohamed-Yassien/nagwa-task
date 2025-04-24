import 'package:flutter/material.dart';

import '../../controllers/books_states.dart';

class GetLoadMoreWidgetBasedOnState extends StatelessWidget {
  const GetLoadMoreWidgetBasedOnState({
    super.key,
    required this.pageState,
    this.inGridl = false,
  });

  final dynamic pageState;
  final bool inGridl;

  @override
  Widget build(BuildContext context) {
    return pageState is GetBooksLoadingMoreState
        ? inGridl
            ? Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              )
        : pageState is GetBooksLoadMoreErrorState
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  pageState.errorMessage,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : SizedBox();
  }
}
