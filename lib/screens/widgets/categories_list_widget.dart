import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41.0.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 41.0.h,
          width: 119.0.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorsConst.colorFromHex('#70B9BE')),
          child: Center(
            child: Text(
              "BreakFast",
              style: myFontStyle(color: Colors.white),
            ),
          ),
        ),
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12,
          );
        },
      ),
    );
  }
}