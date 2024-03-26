import 'package:flutter/material.dart';
import 'package:grocery/widgets/one_sale.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/onSaleScreen';
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Product On Sale',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(12),
            child: Icon(IconlyLight.arrow_left_2)),
      ),
      body: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        childAspectRatio: size.width / (size.height * 0.45),
        padding: EdgeInsets.zero,
        children: List.generate(
          16,
          (index) => OneSale(),
        ),
      ),
    );
  }
}
