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
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            provider.seleectCategory(categories?[index]??"");
          },
          child: Container(
            height: 41.0.h,
            width: 119.0.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color:categories?[index]==provider.selectedCategory? ColorsConst.colorFromHex('#70B9BE'): ColorsConst.colorFromHex('#F1F5F5')),
            child: Center(
              child: Text(
                categories?[index]??'',
                style: myFontStyle(color:categories?[index]==provider.selectedCategory? Colors.white:Colors.black),
              ),
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