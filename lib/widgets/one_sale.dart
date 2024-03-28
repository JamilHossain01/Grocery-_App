import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/product_details.dart';
import 'package:grocery/services/global_method.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/price_widgets.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class OneSale extends StatefulWidget {
  const OneSale({Key? key}) : super(key: key);

  @override
  State<OneSale> createState() => _OneSaleState();
}

class _OneSaleState extends State<OneSale> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;

    Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(01),
        child: InkWell(
          onTap: () {
            GetMethod.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                    ),
                    // Image.network(
                    //   'http://via.placeholder.com/350x150',
                    //   height: size.width * 0.22,
                    //   width: size.width * 0.22,
                    // ),
                    Column(
                      children: [
                        TextWidget(
                          text: '1KG',
                          color: color,
                          textSize: 16,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(IconlyLight.bag_2),
                            ),
                            HeartIconsW(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PriceWidget(
                      salPrice: 5.9,
                      price: 8.9,
                      textPrice: '1',
                      isOnsale: true,
                    ),
                    TextWidget(
                      text: "Apples",
                      color: color,
                      textSize: 22,
                      isTitle: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
