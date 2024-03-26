import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/widgets/feed_items.dart';
import 'package:grocery/widgets/one_sale.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/FeedScreen';
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  void dispose() {
    _textEditingController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    Size size = Utils(context).getScreenSize;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            print('ok');
          },
          child: Icon(IconlyLight.arrow_left_2),
        ),
        title: TextWidget(
          text: 'All Products',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  focusNode: _searchFocusNode,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(IconlyLight.search),
                    hintText: 'Seacrh your Favorite Items',
                    suffix: IconButton(
                      onPressed: () {
                        _textEditingController.clear();
                        _searchFocusNode.unfocus();
                      },
                      icon: Icon(IconlyLight.close_square,
                          color: _searchFocusNode.hasFocus
                              ? Colors.red
                              : Colors.blue),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.60),
              padding: EdgeInsets.zero,
              children: List.generate(
                16,
                (index) => FeedItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
