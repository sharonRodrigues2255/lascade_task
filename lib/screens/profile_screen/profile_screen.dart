import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/screens/product_details/product_details.dart';
import 'package:provider/provider.dart';

import '../../core/consts/icons_consts.dart';
import '../../core/consts/image_consts.dart';
import '../../core/helpers/colors.dart';
import '../../models/product_model.dart';
import '../../providers/home_screen_provider/home_screen_async_provider.dart';
import '../home_screen/widgets/medium_title_widget.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =Provider.of<HomeScreenAsyncProvider>(context).favorites;
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
                actions: [const Icon(Icons.settings_outlined)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildProfileHeader(),
                  if (favorites.isNotEmpty) ...[
                    SizedBox(height: 24.0.h),
                    _buildFavoritesGrid(favorites),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             CircleAvatar(
              backgroundColor: Colors.red,
                                backgroundImage: NetworkImage(ImageConsts.jamesSpaderImage),        

              radius: 24,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alena Sabyan",
                  maxLines: 2,
                  style: myFontStyle(weight: FontWeight.w700, size: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  "Recipe developer",
                  style:
                      myFontStyle(color: ColorsConst.colorFromHex('#97A2B0')),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(IconsConsts.gotoIcon),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid(List<ProductModel> favorites) {
    return Column(
      children: [
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
            const SizedBox(width: 23),
          ],
        ),
        GridView.builder(
          itemCount: favorites.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 156.0.w / 230.0.h,
            crossAxisCount: 2,crossAxisSpacing: 12
          ),
          itemBuilder: (context, index) {
            final product = favorites[index];
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
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
                      padding: EdgeInsets.all(16.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),),
                            child: CachedNetworkImage(
                              imageUrl: product.image ?? "",
                              width: 132.0.w,
                              height: 88.0.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          SizedBox(height: 12.0.h),
                          Text(
                            product.title??"",
                            style: myFontStyle(weight: FontWeight.w700, size: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 12.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               CircleAvatar(
                                                  backgroundImage: NetworkImage(ImageConsts.jamesSpaderImage),        
                  
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundImage: NetworkImage(ImageConsts.jamesSpaderImage),        
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "James Spader",
                                style: myFontStyle(
                                    color: ColorsConst.colorFromHex('#97A2B0')),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0.h),
                        ],
                      ),
                    ),
                  ),
                ),
                  Consumer<HomeScreenAsyncProvider>(
                      builder: (context, provider, child) {
                    {
                      return Positioned(
                        right: 20,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            provider.addAndRemoveFavorites(product);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: provider.favorites.contains(product)
                                ? Icon(
                                    Icons.favorite,size: 16,
                                    color: ColorsConst.colorFromHex('#70B9BE'),
                                  )
                                : Icon(Icons.favorite_border,size: 16,),
                          ),
                        ),
                      );
                    }
                  }),
        
              ],
            );
          },
        ),
      ],
    );
  }
}
