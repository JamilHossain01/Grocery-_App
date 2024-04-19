import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/models/products_model.dart';
import 'package:grocery/inner_screens/product_details.dart';
import 'package:grocery/services/global_method.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/price_widgets.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';

import 'package:provider/provider.dart';

class FeedItems extends StatefulWidget {
  FeedItems({Key? key, }) : super(key: key);


  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = '1';
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    final Size size = Utils(context).getScreenSize;
    final productModel = Provider.of<ProductModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.4),
        child: InkWell(
          onTap: () {
            GetMethod.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FancyShimmerImage(
                imageUrl: productModel.imageUrl,
                height: size.width * 0.22,
                width: size.width * 0.2,
              ),
              Row(
                children: [
                  Flexible(flex: 3,
                      child: TextWidget(text: productModel.title, color: color, textSize: 22)),
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Flexible(flex: 1,
                      child: HeartIconsW())
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: PriceWidget(
                      isOnsale: true,
                      salPrice:productModel.salePrice,
                      price:productModel.price,
                      textPrice: _textEditingController.text,
                    ),
                  ),
                  Flexible(flex: 3,
                    child: FittedBox(
                      child: TextWidget(text: productModel.isPiece?'peace':'KG', color: color, textSize: 16),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      key: const ValueKey('10'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ],
                      enabled: true,
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: TextWidget(
                      text: 'Add to Cart', color: color, textSize: 22))
            ],
          ),
        ),
      ),
    );
  }
}
