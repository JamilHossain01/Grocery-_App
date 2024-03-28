import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/screens/wish/wish_widget.dart';
import 'package:grocery/widgets/back_widgte.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class WishScreen extends StatelessWidget {
  static String routeName = '/WishScreen';

  const WishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackWidget(),
        title: TextWidget(
          text: "Wishlist(8)",
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.delete),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
        itemCount: 10,
        itemBuilder: (context, index) {
          return WishlisWidget();
        },
      ),
    );
  }
}
