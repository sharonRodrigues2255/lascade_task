import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/screens/home_screen/widgets/medium_title_widget.dart';
import 'package:lascade_task/screens/widgets/categories_list_widget.dart';
import 'package:lascade_task/screens/widgets/recipies_small_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppBar(
              leading: Icon(Icons.arrow_back),
              centerTitle: true,
              title: Text(
                "Search",
                style: myFontStyle(weight: FontWeight.w800, size: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: ColorsConst.colorFromHex("#E6EBF2"))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: ColorsConst.colorFromHex("#E6EBF2"))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: ColorsConst.colorFromHex("#E6EBF2"))),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: ColorsConst.colorFromHex("#E6EBF2")))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 16),
            child: Column(
              children: [
                CategoriesListWidget(),
                Row(
                  children: [
                    MediumTitleWidget(title: "Popular Recipes"),
                    const Spacer(),
                    Text(
                      'View All',
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
                Row(
                  children: [
                    MediumTitleWidget(title: "Editors Choice"),
                    const Spacer(),
                    Text(
                      'View All',
                      style: myFontStyle(
                          weight: FontWeight.w800,
                          color: ColorsConst.colorFromHex('#70B9BE')),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 24,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 84,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    width: 130,
                                    child: Text(
                                      "Easy homemade beef burger",
                                      maxLines: 2,
                                      style: myFontStyle(
                                          weight: FontWeight.w700, size: 16),
                                    )),
                                  const  SizedBox(height: 8,),
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
                                )
                              ],
                            ),
                          const Spacer(),
                          SvgPicture.asset(IconsConsts.gotoIcon)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
