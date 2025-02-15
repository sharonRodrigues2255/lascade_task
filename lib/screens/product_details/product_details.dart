import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/main.dart';
import 'package:lascade_task/models/product_model.dart';
import 'package:lascade_task/providers/home_screen_provider/home_screen_async_provider.dart';
import 'package:lascade_task/screens/product_details/widgets/expandable_text.dart';
import 'package:provider/provider.dart';

import '../home_screen/widgets/medium_title_widget.dart';
import '../widgets/recipies_small_card.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProductImage(context, product),
            _buildProductInfo(product),
            _buildGridViewWidget(),
            _buildIngredientsSection(),
            _buildCreatorAndRelatedRecipes(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, ProductModel product) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: product.image ?? "",
          height: 280.0.h,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: Colors.red),
        ),
        Positioned(
          top: 55.0.h,
          left: 24.0.w,
          right: 24.0.w,
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
                child: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),
      ],
    );
  }
Widget _buildProductInfo(ProductModel product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                product.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: myFontStyle(weight: FontWeight.w800, size: 24),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Icon(Icons.access_time,
                    color: ColorsConst.colorFromHex('#748189'), size: 18),
                const SizedBox(width: 4),
                Text("20 Min",
                    style: myFontStyle(
                        color: ColorsConst.colorFromHex('#748189'))),
              ],
            )
          ],
        ),
        const SizedBox(height: 6),
        ExpandableText(text: product.description ?? ''),
      ],
    ),
  );
}

  Widget _buildGridViewWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      color: ColorsConst.colorFromHex('#E6EBF2'),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(IconsConsts.proteins),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '27g proteins',
                  style: myFontStyle(
                      color: ColorsConst.colorFromHex('#0A2533'), size: 16),
                )
              ],
            );
          }),
    );
  }

  Widget _buildIngredientsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumTitleWidget(title: "Ingredients"),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => Card(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amberAccent,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text("Red Cabbage",
                        style: myFontStyle(size: 18, weight: FontWeight.w800)),
                    const Spacer(),
                    Icon(Icons.remove,
                        color: ColorsConst.colorFromHex('#70B9BE')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("2", style: myFontStyle(size: 16)),
                    ),
                    Icon(Icons.add, color: ColorsConst.colorFromHex('#70B9BE')),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorAndRelatedRecipes() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumTitleWidget(title: "Creator"),
          Row(
            children: [
              const CircleAvatar(radius: 24, backgroundColor: Colors.white),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("James Spader", style: myFontStyle(size: 16)),
                  Text("I'm the author and recipe developer.",
                      style: myFontStyle(
                          color: ColorsConst.colorFromHex('#48525F'))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          MediumTitleWidget(title: "Related Recipes"),
          const SizedBox(height: 8),
          SizedBox(
            height: 136,
            child: Consumer<HomeScreenAsyncProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.products?.length ?? 0,
                  itemBuilder: (context, index) =>
                      RecipiesSmallCard(product: provider.products![index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
