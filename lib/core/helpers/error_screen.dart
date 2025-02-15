
import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

class TryAgainScreen extends StatelessWidget {
  final String error;
  final Function() recall;
  const TryAgainScreen({super.key, required this.recall, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: myFontStyle(size: 12),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  recall.call();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsConst.colorFromHex('#3DA0A7'),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Try again",
                    style: myFontStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
