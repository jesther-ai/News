import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.iconData,
    required this.buttonColor,
    required this.iconColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Color iconColor;
  final Color buttonColor;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: HexColor('#8855d7'),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: iconColor,
          size: 15,
        ),
      ),
    );
  }
}
