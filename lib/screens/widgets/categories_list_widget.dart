import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/providers/home_screen_provider/home_screen_async_provider.dart';

class CategoriesListWidget extends StatelessWidget {
  final HomeScreenAsyncProvider provider;
  const CategoriesListWidget({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    final categories = provider.categories;
    return SizedBox(
      height: 41.0.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories?.length??0,
        itemBuilder: (context, index) => Container(
          height: 41.0.h,
          width: 119.0.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorsConst.colorFromHex('#70B9BE')),
          child: Center(
            child: Text(
              categories?[index]??'',
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