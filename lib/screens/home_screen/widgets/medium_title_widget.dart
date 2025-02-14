import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

class MediumTitleWidget extends StatelessWidget {
  final String title;
  const MediumTitleWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 24,bottom: 12),child:  Text(title,style: myFontStyle(weight: FontWeight.w800,size: 20),),);
  }
}
