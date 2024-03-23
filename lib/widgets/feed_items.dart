import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/widgets/price_widgets.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class FeedItems extends StatefulWidget {
  FeedItems({Key? key}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.4),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                height: size.width * 0.22,
                width: size.width * 0.22,
              ),
              Row(
                children: [
                  TextWidget(text: "Product", color: color, textSize: 22),
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.heart),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: PriceWidget(
                      isOnsale: true,
                      salPrice: 5.9,
                      price: 8.9,
                      textPrice: _textEditingController.text,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      child: TextWidget(text: 'KG', color: color, textSize: 16),
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
