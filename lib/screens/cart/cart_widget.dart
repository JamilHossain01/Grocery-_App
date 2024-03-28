import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class Cartwidget extends StatefulWidget {
  const Cartwidget({super.key});

  @override
  State<Cartwidget> createState() => _CartwidgetState();
}

class _CartwidgetState extends State<Cartwidget> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = '0';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6)),
            child: Container(
              height: size.width * 0.25,
              width: size.width * 0.25,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                height: size.width * 0.22,
                width: size.width * 0.22,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          // Column(
          //   children: [
          //     TextWidget(text: 'Apple', color: color, textSize: 22),
          //     ItemCount(
          //       initialValue: 0,
          //       minValue: 0,
          //       maxValue: 10,
          //       decimalPlaces: 0,
          //       onChanged: (value) {
          //         // Handle counter value changes
          //         print('Selected value: $value');
          //       },
          //     ),
          //   ],
          // ),
          Column(
            children: [
              TextWidget(
                text: 'Title',
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Row(
                  children: [
                    _quantityControler(
                      size: size,
                      fct: () {
                        if (_quantityController.text == '0') {
                          return;
                        } else {
                          setState(() {
                            _quantityController.text =
                                (int.parse(_quantityController.text) - 1)
                                    .toString();
                          });
                        }
                      },
                      color: Colors.red.shade500,
                      icon: CupertinoIcons.minus,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _quantityController.text = '0';
                            } else {
                              return;
                            }
                          });
                        },
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                        ],
                      ),
                    ),
                    _quantityControler(
                        size: size,
                        fct: () {
                          _quantityController.text =
                              (int.parse(_quantityController.text) + 1)
                                  .toString();
                        },
                        color: Colors.green.shade400,
                        icon: CupertinoIcons.plus)
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              InkWell(onTap: () {}, child: Icon(IconlyLight.buy)),
              const HeartIconsW(),
              TextWidget(text: '\$0.52', color: color, textSize: 22),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityControler({
    required Size size,
    required Function fct,
    required Color color,
    required IconData icon,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: color,
          child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                fct();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(icon),
              )),
        ),
      ),
    );
  }
}
