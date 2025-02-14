
import 'package:flutter/material.dart';
import 'package:lascade_task/core/helpers/size_config.dart';
import 'package:lascade_task/core/helpers/text_style.dart';

class RecipiesSmallCard extends StatelessWidget {
  const RecipiesSmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 8.0.w, right: 8.0.w, top: 8),
      child: Column(
        children: [
          Container(
            height: 84,
            width: 84.0.w,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 84.0.w,
            child: Text(
              "Product nafssfdsme",
              style: myFontStyle(size: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
