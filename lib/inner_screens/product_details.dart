import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = '/ProductDetails';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController _quantityTextController =
      TextEditingController(text: '1');
  void dispos() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    final productProviders = Provider.of<ProductProvider>(context);
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProd = productProviders.findProdByID(productID);
    double usedPrice = getCurrProd.isOnSale?getCurrProd.salePrice:getCurrProd.price;
    double totalPrice = usedPrice*int.parse(_quantityTextController.text);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          child: const Icon(IconlyLight.arrow_left_2),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: FancyShimmerImage(
              imageUrl: getCurrProd.imageUrl,
              width: double.infinity,
              height: size.height * 0.60,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: TextWidget(
                                text: getCurrProd.title, color: color, textSize: 22)),
                        const HeartIconsW(),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          TextWidget(
                            text: '\$${usedPrice.toStringAsFixed(2)}',
                            textSize: 22,
                            color: color,
                            isTitle: true,
                          ),
                          TextWidget(text: getCurrProd.isPiece?'peace':'/KG', color: color, textSize: 22),
                           Visibility(
                            visible:getCurrProd.isOnSale?true:false,
                            child: Text(
                              '\$${getCurrProd.price.toStringAsFixed(2)}',
                              style: TextStyle(),
                            ),
                          ),
                          const Spacer(),
                          Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                    text: 'Add to cart',
                                    color: color,
                                    textSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: quantityController(
                            color: Colors.green.shade700,
                            fact: () {
                              if (_quantityTextController.text == '1') {
                                return;
                              } else {
                                setState(() {
                                  _quantityTextController.text =
                                      (int.parse(_quantityTextController.text) -
                                              1)
                                          .toString();
                                });
                              }
                            },
                            icon: CupertinoIcons.minus_circle),
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _quantityTextController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9.]'),
                            ),
                          ],
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                _quantityTextController.text = '1';
                              } else {}
                            });
                          },
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: quantityController(
                            color: Colors.red,
                            fact: () {
                              setState(() {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) +
                                            1)
                                        .toString();
                              });
                            },
                            icon: CupertinoIcons.plus_circle),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).cardColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TextWidget(
                                text: 'Total', color: color, textSize: 18),
                            Row(
                              children: [
                                TextWidget(
                                    text: '\$${totalPrice.toStringAsFixed(2)}/',
                                    color: color,
                                    textSize: 18),
                                TextWidget(
                                    text: '${_quantityTextController.text}KG',
                                    color: color,
                                    textSize: 22)
                              ],
                            )
                          ],
                        ),
                        Material(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                  text: 'Add to cart',
                                  color: color,
                                  textSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget quantityController({
    required Color color,
    required Function fact,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              fact();
            },
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
