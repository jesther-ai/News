import 'package:flutter/material.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    required this.categoryName,
    Key? key,
  }) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(65),
        ),
      ),
      height: 25,
      width: 100,
      child: Center(
        child: Text(
          categoryName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
