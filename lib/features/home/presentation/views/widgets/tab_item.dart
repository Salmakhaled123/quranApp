import 'package:flutter/material.dart';
class TabItem extends StatelessWidget {
  const TabItem({Key? key, required this.text,}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child:  Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
