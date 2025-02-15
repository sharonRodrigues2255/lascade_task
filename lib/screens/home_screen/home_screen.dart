import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/error_screen.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/models/product_model.dart';
import 'package:lascade_task/screens/home_screen/widgets/medium_title_widget.dart';
import 'package:lascade_task/screens/product_details/product_details.dart';
import 'package:lascade_task/screens/widgets/categories_list_widget.dart';
import 'package:provider/provider.dart';
import '../../providers/home_screen_provider/home_screen_async_provider.dart';
import 'widgets/carousel_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider =
          Provider.of<HomeScreenAsyncProvider>(context, listen: false);
      provider.fetchProducts();
      provider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenAsyncProvider>(context);
    final products = provider.products;
    final isLoading = provider.isLoading;

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.productError != null
              ? TryAgainScreen(
                  recall: () {
                    provider.fetchProducts();
                  },
                  error: provider.productError ?? "")
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(IconsConsts.goodMorning,
                                  height: 24),
                              const SizedBox(width: 4),
                              Text('Good Morning', style: myFontStyle()),
                              const Spacer(),
                              SvgPicture.asset(IconsConsts.cartIcon,
                                  height: 24),
                              const SizedBox(width: 24),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Aleena Sabyan",
                            style:
                                myFontStyle(weight: FontWeight.w800, size: 24),
                          ),
                          MediumTitleWidget(title: "Featured"),
                          _carousalWidget(products ?? []),
                          _categorySection(provider),
                          _popularRecipesSection(products ?? []),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _carousalWidget(List<ProductModel> products) {
    return SizedBox(
      height: 172.0.h,
      width: MediaQuery.of(context).size.width - 24,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          product: product,
                        )));
              },
              child: CarouselContainerWidget(prduct: product));
        },
      ),
    );
  }

  Widget _categorySection(HomeScreenAsyncProvider provider) {
    return Column(
      children: [
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
            const SizedBox(width: 23),
          ],
        ),
        provider.categories == null
            ? const Center(child: Text("No Categories"))
            : CategoriesListWidget(provider: provider),
      ],
    );
  }

  Widget _popularRecipesSection(List<ProductModel> products) {
    return Column(
      children: [
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
            const SizedBox(width: 23),
          ],
        ),
        SizedBox(
          height: 290.0.h,
          child: ListView.separated(clipBehavior: Clip.none,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];

              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                product: product,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsConst.colorFromHex('1A063336'),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: product.image ?? "",
                                width: 168.0.w,
                                height: 128.0.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error, color: Colors.red),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: 168,
                              child: Text(
                                product.title ?? "Unknown Recipe",
                                style: myFontStyle(
                                    weight: FontWeight.w700, size: 16),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                SvgPicture.asset(IconsConsts.calorieIcon),
                                const SizedBox(width: 8),
                                Text("120 Kcal",
                                    style: myFontStyle(
                                        color:
                                            ColorsConst.colorFromHex("#97A2B0"))),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                        ColorsConst.colorFromHex("#97A2B0")),
                                const SizedBox(width: 8),
                                Icon(Icons.access_time,
                                    size: 16,
                                    color: ColorsConst.colorFromHex("#97A2B0")),
                                const SizedBox(width: 8),
                                Text("120 Min",
                                    style: myFontStyle(
                                        color:
                                            ColorsConst.colorFromHex("#97A2B0"))),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<HomeScreenAsyncProvider>(
                      builder: (context, provider, child) {
                    {
                      return Positioned(
                        right: 30,
                        top: 30,
                        child: GestureDetector(
                          onTap: () {
                            provider.addAndRemoveFavorites(product);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: provider.favorites.contains(product)
                                ? Icon(
                                    Icons.favorite,
                                    color: ColorsConst.colorFromHex('#70B9BE'),
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ),
                      );
                    }
                  }),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
