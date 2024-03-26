import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HeartIconsW extends StatelessWidget {
  const HeartIconsW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        IconlyLight.heart,
        color: Colors.red,
      ),
    );
  }
}
