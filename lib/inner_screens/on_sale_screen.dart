import 'package:flutter/material.dart';
import 'package:grocery/models/products_model.dart';
import 'package:grocery/providers/product_provider.dart';
import 'package:grocery/widgets/one_sale.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/onSaleScreen';

  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> productOnsale = productProvider.getOnsaleProducts;

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
      body:
      // productOnsale.isEmpty?Column(
      //   children: [
      //     Image.asset('assets/images/box.png'),Text('No product on sale yet\nStay tuned',)
      //   ],
      //
      //
      // ):
      GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        childAspectRatio: size.width / (size.height * 0.45),
        padding: EdgeInsets.zero,
        children: List.generate(
          productOnsale.length,
          (index) => ChangeNotifierProvider.value(
              value: productOnsale[index], child: OneSale()),
        ),
      ),
    );
  }
}
