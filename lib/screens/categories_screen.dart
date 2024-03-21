import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/widgets/categories_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Color> gridColors = [
    Colors.lightGreen.shade900,
    Colors.lightGreen.shade800,
    Colors.lightGreen.shade700,
    Colors.lightGreen.shade600,
    Colors.lightGreen.shade500,
    Colors.lightGreen.shade400,
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imagePath': 'assets/images/cat/fruits.png',
      'catText': "Fruits",
    },
    {'imagePath': 'assets/images/cat/grains.png', 'catText': 'Grains'},
    {
      "imagePath": 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imagePath': 'assets/images/cat/veg.png',
      'catText': 'Vegitables',
    },
    {
      'imagePath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imagePath': 'assets/images/cat/Spinach.png',
      'catText': 'Spinach',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 28,
          isTitle: true,
        ),
        elevation: 1,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 240 / 259,
        children: List.generate(catInfo.length, (index) {
          return CategoriesWidget(
            catText: catInfo[index]['catText'],
            imagePath: catInfo[index]['imagePath'],
            passedColors: gridColors[index],
          );
        }),
      ),
    );
  }
}
