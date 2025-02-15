import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/consts/icons_consts.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/models/product_model.dart';
import 'package:lascade_task/providers/search_provider/search_provider.dart';
import 'package:lascade_task/screens/home_screen/widgets/medium_title_widget.dart';
import 'package:lascade_task/screens/widgets/categories_list_widget.dart';
import 'package:lascade_task/screens/widgets/recipies_small_card.dart';
import 'package:provider/provider.dart';
import '../../providers/home_screen_provider/home_screen_async_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenAsyncProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(),
              _buildSearchField(provider),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 16),
                child: Column(
                  children: [
                    _buildSearchResults(),
                    CategoriesListWidget(provider: provider),
                    _buildSectionTitle("Popular Recipes"),
                    _buildHorizontalRecipeList(provider),
                    _buildSectionTitle("Editors Choice"),
                    _buildEditorsChoiceList(provider),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text("Search", style: myFontStyle(weight: FontWeight.w800, size: 24)),
      ),
    );
  }

  Widget _buildSearchField(HomeScreenAsyncProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      child: TextFormField(
        onChanged: (value) {
          Provider.of<SearchProvider>(context, listen: false).searchProducts(value,provider.products??[]);
        },
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          focusedBorder: _borderStyle(),
          border: _borderStyle(),
          enabledBorder: _borderStyle(),
          disabledBorder: _borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: ColorsConst.colorFromHex("#E6EBF2")),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        MediumTitleWidget(title: title),
        const Spacer(),
        Text(
          'View All',
          style: myFontStyle(weight: FontWeight.w800, color: ColorsConst.colorFromHex('#70B9BE')),
        ),
        SizedBox(width: 23),
      ],
    );
  }

  Widget _buildHorizontalRecipeList(HomeScreenAsyncProvider provider) {
    return SizedBox(
      height: 136,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provider.products?.length ?? 0,
        itemBuilder: (context, index) => RecipiesSmallCard(
          product: provider.products?[index] ?? ProductModel(),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 16),
      ),
    );
  }

  Widget _buildEditorsChoiceList(HomeScreenAsyncProvider provider) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.products?.length ?? 0,
      separatorBuilder: (context, index) => SizedBox(height: 24),
      itemBuilder: (context, index) => _buildEditorsChoiceCard(provider.products?[index] ?? ProductModel()),
    );
  }

  Widget _buildEditorsChoiceCard(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? "",
                  height: 84,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                ),
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      product.title ?? "Unknown Product",
                      maxLines: 2,
                      style: myFontStyle(weight: FontWeight.w700, size: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(radius: 10, backgroundColor: Colors.white, child: CircleAvatar(radius: 9, backgroundColor: Colors.black)),
                      SizedBox(width: 8),
                      Text("James Spader", style: myFontStyle(color: ColorsConst.colorFromHex('#97A2B0'))),
                    ],
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(IconsConsts.gotoIcon)
            ],
          ),
        ),
      ),
    );
  }
Widget _buildSearchResults() {
  return Consumer<SearchProvider>(
    builder: (context, provider, child) {
      if (provider.filteredProducts.isEmpty) {
        return const SizedBox();
      }
      
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.filteredProducts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildEditorsChoiceCard(provider.filteredProducts[index]),
          );
        },
      );
    },
  );
}

}
