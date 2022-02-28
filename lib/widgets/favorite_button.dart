import 'package:flutter/material.dart';

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
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 3),
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
