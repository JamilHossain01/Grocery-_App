import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/cart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Cart',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        actions: [
          Icon(IconlyLight.delete),
        ],
      ),
      body: Column(
        children: [
          _checkOut(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Cartwidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkOut({required BuildContext ctx}) {
    Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      TextWidget(text: 'Order Now', color: color, textSize: 20),
                ),
              ),
            ),
            Spacer(),
            FittedBox(
                child: TextWidget(
                    text: 'Total:\$10.26', color: color, textSize: 20)),
          ],
        ),
      ),
    );
  }
}
