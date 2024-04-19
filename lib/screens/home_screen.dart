import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/consts/consts.dart';
import 'package:grocery/inner_screens/feed_screen.dart';
import 'package:grocery/inner_screens/on_sale_screen.dart';
import 'package:grocery/services/global_method.dart';
import 'package:grocery/widgets/feed_items.dart';
import 'package:grocery/widgets/one_sale.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getProducts;
    List<ProductModel> productOnsale = productProvider.getOnsaleProducts;

    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeSize: size.height * 0.02,
                    )),
                control: const SwiperControl(
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  GetMethod.navigateTo(
                      context: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: "View All",
                  color: Colors.blue,
                  textSize: 22,
                  isTitle: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        TextWidget(
                            text: 'ON SAlE', color: Colors.red, textSize: 22),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            IconlyLight.discount,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                              value: productOnsale[index],
                              child: OneSale(),
                            );
                          },
                          itemCount:productOnsale.length),
                    ),
                  ),
                ],
              ),
            ),
            SectionTile(
              color: color,
              title: 'Our products',
            ),
            // FeedItems(),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.62),
              crossAxisCount: 2,
              children: List.generate(
                (allProducts.length > 8 ? allProducts.length : 8),
                (index) {
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: FeedItems(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTile extends StatelessWidget {
  const SectionTile({
    super.key,
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: title,
          color: color,
          textSize: 22,
          isTitle: true,
        ),
        TextButton(
            onPressed: () {
              GetMethod.navigateTo(
                  context: context, routeName: FeedScreen.routeName);
            },
            child: const Text(
              'View All',
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ))
      ],
    );
  }
}
