import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/screens/home_screen/widgets/medium_title_widget.dart';
import 'package:lascade_task/screens/product_details/product_details.dart';
import 'package:lascade_task/screens/widgets/categories_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsConsts.goodMorning, height: 24),
                    const SizedBox(width: 4),
                    Text('Good Morning', style: myFontStyle()),
                    const Spacer(),
                    SvgPicture.asset(IconsConsts.cartIcon, height: 24),
                    const SizedBox(
                      width: 24,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Aleena Sabyan",
                  style: myFontStyle(weight: FontWeight.w800, size: 24),
                ),
                MediumTitleWidget(title: "Featured"),
                _carousalWidget(),
                Row(
                  children: [
                    MediumTitleWidget(title: "Category"),
                    const Spacer(),
                    Text(
                      'See All',
                      style: myFontStyle(
                          weight: FontWeight.w800,
                          color: ColorsConst.colorFromHex('#70B9BE')),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                  ],
                ),
                CategoriesListWidget(),
                Row(
                  children: [
                    MediumTitleWidget(title: "Popular Recipes"),
                    const Spacer(),
                    Text(
                      'See All',
                      style: myFontStyle(
                          weight: FontWeight.w800,
                          color: ColorsConst.colorFromHex('#70B9BE')),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                  ],
                ),
                SizedBox(
                  height: 290.0.h,
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: ColorsConst.colorFromHex('1A063336'),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ], color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 168.0.w,
                                height: 128.0.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                  width: 168,
                                  child: Text(
                                    "Healthy Taco Salad with fresh vegetable",
                                    style: myFontStyle(
                                        weight: FontWeight.w700, size: 16),
                                    maxLines: 2,
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(IconsConsts.calorieIcon),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "120 Kcal",
                                    style: myFontStyle(
                                        color: ColorsConst.colorFromHex(
                                            "#97A2B0")),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                        ColorsConst.colorFromHex("#97A2B0"),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.access_time,
                                      size: 16,
                                      color:
                                          ColorsConst.colorFromHex("#97A2B0")),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "20 Min",
                                    style: myFontStyle(
                                        color: ColorsConst.colorFromHex(
                                            "#97A2B0")),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 16,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _carousalWidget() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(),
        ));
      },
      child: SizedBox(
        height: 172.0.h,
        width: MediaQuery.of(context).size.width - 24,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              width: 264.0.w,
              height: 172.0.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.0.w,
                    child: Text(
                      "Asian white noodle with extra seafood",
                      style: myFontStyle(
                          color: Colors.white,
                          weight: FontWeight.w700,
                          size: 18),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
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
                        style: myFontStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Text(
                        "20 Min",
                        style: myFontStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
