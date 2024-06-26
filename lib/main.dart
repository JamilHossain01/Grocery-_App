import 'package:flutter/material.dart';
import 'package:grocery/consts/theme_data.dart';
import 'package:grocery/inner_screens/feed_screen.dart';
import 'package:grocery/inner_screens/on_sale_screen.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/bottom_bar_screen.dart';
import 'package:grocery/screens/cart/product_details.dart';
import 'package:grocery/screens/cart/new_design.dart';
import 'package:grocery/screens/wish/wish_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottombarScreen(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedScreen.routeName: (context) => const FeedScreen(),
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishScreen.routeName: (context) => const WishScreen(),
          },
        );
      }),
    );
  }
}
