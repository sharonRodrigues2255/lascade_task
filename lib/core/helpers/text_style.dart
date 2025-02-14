
import 'package:flutter/material.dart';
import 'package:lascade_task/core/consts/font_const.dart';
import 'package:lascade_task/core/helpers/colors.dart';

TextStyle myFontStyle({
  double? size,
  Color? color,
  FontWeight? weight,
  TextDecoration? decoration,
  double? height,
}) {
  return TextStyle(
    decoration: decoration,
      fontFamily: FontConst.fontFamily,
      fontSize: size ?? 14.0,
      color: color ?? ColorsConst.colorFromHex('#0A2533'),
      fontWeight: weight ?? FontWeight.w400);
}
