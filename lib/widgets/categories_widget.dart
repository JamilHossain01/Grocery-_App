// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {Key? key,
      required this.passedColors,
      this.catText,
      required this.imagePath})
      : super(key: key);
  final catText, imagePath;
  final Color passedColors;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final _screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: _screenWidth * 0.5,
          height: _screenWidth * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: passedColors, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: _screenWidth * 0.3,
                  width: _screenWidth * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fill),
                  ),
                ),
                TextWidget(
                  text: catText,
                  color: color,
                  textSize: 25,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
