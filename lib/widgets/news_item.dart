import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.title,
    required this.description,
    required this.imageSource,
    Key? key,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageSource;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 15),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: HexColor('#000000'),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: HexColor('#000000'),
            ),
          ),
        ],
      ),
    );
  }
}
