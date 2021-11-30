import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class TopMenuItem extends StatelessWidget {
  const TopMenuItem({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      width: 90,
      height: 35,
      decoration: BoxDecoration(
        color: HexColor('#226FCC'),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: HexColor('#FFFFFF'),
          ),
        ),
      ),
    );
  }
}
