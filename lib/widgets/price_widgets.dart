import 'package:flutter/material.dart';
import 'package:grocery/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.salPrice,
      required this.price,
      required this.textPrice,
      required this.isOnsale});
  final double salPrice, price;
  final String textPrice;
  final bool isOnsale;

  @override
  Widget build(BuildContext context) {
    double userPrice = isOnsale ? salPrice : price;
    return Row(
      children: [
        TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Colors.blue.shade400,
            textSize: 16),
        const SizedBox(
          width: 10,
        ),
        Visibility(
          visible: isOnsale ? true : false,
          child: Text(
            '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style:
                TextStyle(fontSize: 15, decoration: TextDecoration.lineThrough),
          ),
        ),
      ],
    );
  }
}
