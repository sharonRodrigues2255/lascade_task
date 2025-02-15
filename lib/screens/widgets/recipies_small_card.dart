import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';
import 'package:lascade_task/models/product_model.dart';

class RecipiesSmallCard extends StatelessWidget {
  final ProductModel product;
  const RecipiesSmallCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: product.image ?? "",
              height: 84,
              width: 84.0.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 84.0.w,
            child: Text(
              product.title ?? "Unknown Product",
              style: myFontStyle(size: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
