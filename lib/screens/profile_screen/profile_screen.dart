import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

import '../../core/consts/icons_consts.dart';
import '../../core/helpers/colors.dart';
import '../home_screen/widgets/medium_title_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppBar(
              title: Text(
                "Account",
                style: myFontStyle(weight: FontWeight.w800, size: 24),
              ),
              actions: [Icon(Icons.settings_outlined)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, top: 8, bottom: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 24,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Text(
                              "Alena Sabyan",
                              maxLines: 2,
                              style: myFontStyle(
                                  weight: FontWeight.w700, size: 16),
                            )),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Recipe developer",
                              style: myFontStyle(
                                  color: ColorsConst.colorFromHex('#97A2B0')),
                            )
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(IconsConsts.gotoIcon)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0.h,
                ),
                Row(
                  children: [
                    MediumTitleWidget(title: "My Favorites"),
                    const Spacer(),
                    Text(
                      'See all',
                      style: myFontStyle(
                          weight: FontWeight.w800,
                          color: ColorsConst.colorFromHex('#70B9BE')),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                  ],
                ),
                GridView.builder(itemCount: 10,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 156.0.w/222.0.h,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorsConst.colorFromHex('1A063336'),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ], color: Colors.white),
                        child: Padding(
                          padding:  EdgeInsets.all(16.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 132.0.w,
                                height: 88.0.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                               SizedBox(height: 12.0.h,),
                              SizedBox(
                                  width: 168.0.w,
                                  child: Text(
                                    "Healthy Taco Salad with fresh vegetable",
                                    style: myFontStyle(
                                        weight: FontWeight.w700, size: 16),
                                    maxLines: 2,
                                  )),
                               SizedBox(
                                height: 12.0.h,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [     CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "James Spader",
                                    style: myFontStyle(color: ColorsConst.colorFromHex('#97A2B0')),
                                  ),],
                                ),
                               SizedBox(
                                height: 12.0.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
