import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/product_details.dart';
import 'package:grocery/services/global_method.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class WishlisWidget extends StatelessWidget {
  const WishlisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GetMethod.navigateTo(
              context: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.5),
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: size.width * 0.2,
                  height: size.width * 0.3,
                  child: FancyShimmerImage(
                      width: double.infinity,
                      height: size.width * 0.22,
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png'),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(IconlyLight.bag_2),
                        ),
                        HeartIconsW(),
                      ],
                    ),
                    TextWidget(text: 'Apples', color: color, textSize: 22),
                    TextWidget(text: '\$0.79', color: color, textSize: 22),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
