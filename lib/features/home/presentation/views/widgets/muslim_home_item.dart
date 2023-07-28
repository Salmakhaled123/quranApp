import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class HomeItemImage extends StatelessWidget {
  const HomeItemImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
            color: Colors.purple,
            gradient: LinearGradient(colors: [
              Colors.yellow,
              Colors.green,
            ]),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Image.asset(AssetData.HomeLogo),
      ),
    );
  }
}
