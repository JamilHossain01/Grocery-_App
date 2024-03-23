import 'package:flutter/material.dart';
import 'package:grocery/widgets/feed_items.dart';
import 'package:grocery/widgets/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/onSaleScreen';
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: size.width / (size.height * 62),
        children: List.generate(
          4,
          (index) => FeedItems(),
        ),
      ),
    );
  }
}
