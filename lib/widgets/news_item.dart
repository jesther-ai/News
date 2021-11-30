import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.title,
    required this.imageSource,
    Key? key,
  }) : super(key: key);
  final String title;
  final String imageSource;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      child: Column(
        children: [
          SizedBox(
            height: 480,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(imageSource, fit: BoxFit.cover),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: HexColor('#FFFFFF'),
            ),
          ),
        ],
      ),
    );
  }
}
