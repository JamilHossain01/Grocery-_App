import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : Null;
      },
      child: const Icon(IconlyLight.arrow_left_2),
    );
  }
}
