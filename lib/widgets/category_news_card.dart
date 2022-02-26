import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    required this.categoryName,
    Key? key,
  }) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: setColor(categoryName),
        borderRadius: const BorderRadius.all(
          Radius.circular(65),
        ),
      ),
      height: 25,
      width: 120,
      child: Center(
        child: Text(
          categoryName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Color setColor(String categoryName) {
    if (categoryName.toLowerCase().contains('hack')) {
      return HexColor('#e7d5fc').withOpacity(0.5);
    }
    if (categoryName.toLowerCase().contains('wired')) {
      return HexColor('#aafeff').withOpacity(0.5);
    }
    if (categoryName.toLowerCase().contains('blog')) {
      return HexColor('#e0ddd3').withOpacity(0.5);
    }
    if (categoryName.toLowerCase().contains('news')) {
      return HexColor('#aafefe').withOpacity(0.5);
    }
    if (categoryName.toLowerCase().contains('time')) {
      return HexColor('#063970').withOpacity(0.4);
    } else {
      return HexColor('#c2bbcb').withOpacity(0.5);
    }
  }
}
