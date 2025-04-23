import 'package:flutter/material.dart';

class ExpandableSummary extends StatefulWidget {
  final List<dynamic> summaryList;

  const ExpandableSummary({super.key, required this.summaryList});

  @override
  _ExpandableSummaryState createState() => _ExpandableSummaryState();
}

class _ExpandableSummaryState extends State<ExpandableSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final String summaryText = widget.summaryList.join(" ");

    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: summaryText,
          style: TextStyle(color: Colors.black, fontSize: 16),
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: 3,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final exceedsMaxLines = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              summaryText,
              maxLines: _expanded ? null : 3,
              overflow:
                  _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            if (exceedsMaxLines)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    _expanded ? "See Less" : "See More",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
