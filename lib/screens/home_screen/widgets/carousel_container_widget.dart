import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lascade_task/core/consts/image_consts.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/models/product_model.dart';

import '../../../core/helpers/text_style.dart';

class CarouselContainerWidget extends StatelessWidget {
  final ProductModel prduct;
  const CarouselContainerWidget({
    super.key,required this.prduct,
  });

  @override
  Widget build(BuildContext context) {

return Container(
  padding: EdgeInsets.all(16),
  width: 264.0.w,
  height: 172.0.h,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: prduct.image ?? "",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
        ),
      ),
      Positioned.fill(
        child: Container(
          padding: EdgeInsets.all(16.0.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160.0.w,
                child: Text(
                  prduct.title ?? "",
                  style: myFontStyle(
                      color: Colors.white, weight: FontWeight.w700, size: 18),
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 8.0.h),
              Row(
                children: [
                  CircleAvatar(radius: 10,
                  backgroundImage: NetworkImage(ImageConsts.jamesSpaderImage),        ),
                  SizedBox(width: 8),
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
        ),
      ),
    ],
  ),
);


  }
}
