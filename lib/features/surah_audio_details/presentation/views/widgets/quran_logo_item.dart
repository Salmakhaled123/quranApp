import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class QuranLogoItem extends StatelessWidget {
  const QuranLogoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:  const DecorationImage(
            image: AssetImage(
              AssetData.QuranLogo,
            ),
            fit: BoxFit.fill,
          )),
    );
  }
}
