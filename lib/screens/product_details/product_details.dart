import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/screens/product_details/widgets/expandable_text.dart';

import '../home_screen/widgets/medium_title_widget.dart';
import '../widgets/recipies_small_card.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280.0.h,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      const BoxDecoration(color: Colors.red), // Added const
                ),
                Positioned(
                  top: 55.0.h,
                  left: 24.0.w, // Add left padding for better visual
                  right: 24.0.w, // Add right padding for better visual
                  child: Row(
                    children: [
                      SvgPicture.asset(IconsConsts.closeIcon),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 265.0.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Healthy Taco Salad",
                                style: myFontStyle(
                                    weight: FontWeight.w800, size: 24),
                              ),
                              const Spacer(),
                              ...[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.access_time,
                                    color: ColorsConst.colorFromHex('#748189'),
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  "20 Min",
                                  style: myFontStyle(
                                      color:
                                          ColorsConst.colorFromHex('#748189')),
                                )
                              ]
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ExpandableText(
                              text:
                                  'resizeToAvoidBottomInset: false prevents layout chewewewfddddddddddddddddddddddddddddddddddddddddddddddddddddddanges when the keyboard appears'),
                          SizedBox(
                            height: 16,
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 135.0.w / 40.0.h,
                                      mainAxisSpacing: 16),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: ColorsConst.colorFromHex(
                                              '#E6EBF2'),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(IconsConsts.proteins),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '27g proteins',
                                      style: myFontStyle(
                                          color: ColorsConst.colorFromHex(
                                              '#0A2533'),
                                          size: 16),
                                    )
                                  ],
                                );
                              }),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            height: 52.0.h,
                            width: 326.0.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorsConst.colorFromHex('#E6EBF2')),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 37.0.w, vertical: 12.0.h),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      'Ingredients',
                                      style: myFontStyle(
                                          weight: FontWeight.w700,
                                          size: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 37.0.w, vertical: 12.0.h),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      'Instructions',
                                      style: myFontStyle(
                                          weight: FontWeight.w700,
                                          size: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              MediumTitleWidget(title: "Ingredients"),
                              const Spacer(),
                              Text(
                                'Add All to Cart',
                                style: myFontStyle(
                                    weight: FontWeight.w800,
                                    color: ColorsConst.colorFromHex('#70B9BE')),
                              ),
                              SizedBox(
                                width: 23,
                              ),
                            ],
                          ),
                          Text(
                            '6 items',
                            style: myFontStyle(
                                weight: FontWeight.w800,
                                color: ColorsConst.colorFromHex('#70B9BE')),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                    elevation: 2,
                                    color: Colors.white,
                                    child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.amberAccent),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              'Red Cabbage',
                                              style: myFontStyle(
                                                  size: 18,
                                                  weight: FontWeight.w800),
                                            ),
                                            Spacer(),
                                            ...[
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: ColorsConst
                                                          .colorFromHex(
                                                              '#70B9BE')),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: ColorsConst
                                                        .colorFromHex(
                                                            '#70B9BE'),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  2.toString(),
                                                  style: myFontStyle(size: 16),
                                                ),
                                              ),
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: ColorsConst
                                                          .colorFromHex(
                                                              '#70B9BE')),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: ColorsConst
                                                        .colorFromHex(
                                                            '#70B9BE'),
                                                  ),
                                                ),
                                              )
                                            ]
                                          ],
                                        )),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 12,
                                  ),
                              itemCount: 6),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 54,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorsConst.colorFromHex('#70B9BE')),
                            child: Center(
                              child: Text(
                                "Add cart",
                                style: myFontStyle(
                                    color: Colors.white,
                                    weight: FontWeight.w800),
                              ),
                            ),
                          ),
                          MediumTitleWidget(title: "Creator"),
                           Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "James Spader",
                            style: myFontStyle(color: ColorsConst.colorFromHex('#0A2533'),size: 16
                            ),
                          ),
                          Text("I'm the author and recipe developer.",style: myFontStyle(color: ColorsConst.colorFromHex('#48525F')),)
                        ],
                      ),
                     
                    ],
                  ),   Row(
                  children: [
                    MediumTitleWidget(title: "Related Recipes"),
                    const Spacer(),
                    Text(
                      'See All',
                      style: myFontStyle(
                          weight: FontWeight.w800,
                          color: ColorsConst.colorFromHex('#70B9BE')),
                    ),
                  ],
                ),
                  SizedBox(
                  height: 136,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            child: RecipiesSmallCard(),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 10),
                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
