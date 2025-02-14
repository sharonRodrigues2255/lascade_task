import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({
    Key? key,
    required this.text,
    this.maxLines = 2, 
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = myFontStyle(size: 16, color: ColorsConst.colorFromHex('#748189'));

        // Measure the full text
        final textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: textStyle),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        final bool isOverflowing = textPainter.didExceedMaxLines;

        String displayText = widget.text;
        if (isOverflowing && !_isExpanded) {
          final truncatedPainter = TextPainter(
            text: TextSpan(text: widget.text + '... View More', style: textStyle),
            maxLines: widget.maxLines,
            textDirection: TextDirection.ltr,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
          );

          truncatedPainter.layout(maxWidth: constraints.maxWidth);

          // Find the cut-off point and append "View More"
          int lastIndex = widget.text.length;
          while (truncatedPainter.didExceedMaxLines && lastIndex > 0) {
            lastIndex--;
            truncatedPainter.text = TextSpan(text: widget.text.substring(0, lastIndex) + '... View More', style: textStyle);
            truncatedPainter.layout(maxWidth: constraints.maxWidth);
          }

          displayText = widget.text.substring(0, lastIndex) + '... ';
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: _isExpanded ? widget.text : displayText,
                  style: textStyle,
                ),
                if (isOverflowing)
                  TextSpan(
                    text: _isExpanded ? " View Less" : "View More",
                    style: myFontStyle(size: 16, color: ColorsConst.colorFromHex('#000000')),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
