import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'book_summary.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.item,
  });

  final BookEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: item.coverImage,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                    errorWidget: (context, url, error) => Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey[700],
                        size: 40,
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey[200],
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: List.generate(
                          item.authors.length,
                          (i) => Chip(
                            backgroundColor: Colors.grey.shade200,
                            label: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                textAlign: TextAlign.start,
                                item.authors[i].name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ExpandableSummary(
                summaryList: item.summary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
