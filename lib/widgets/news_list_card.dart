import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/category_news_card.dart';
import 'package:news_app/widgets/time_of_news_card.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({
    required this.image,
    required this.title,
    required this.categoryName,
    required this.timeAndDate,
    Key? key,
  }) : super(key: key);
  final String title;
  final String categoryName;
  final String timeAndDate;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: HexColor('#8855d7'),
            spreadRadius: .2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.only(topRight: Radius.circular(65)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(60)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: HexColor('#8855d7'),
                      spreadRadius: 0.1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(60)),
                child: FadeInImage.assetNetwork(
                  fadeInCurve: Curves.easeInQuart,
                  fadeOutCurve: Curves.easeInQuart,
                  fadeOutDuration: const Duration(milliseconds: 1000),
                  fadeInDuration: const Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  width: 110,
                  height: 150,
                  placeholderFit: BoxFit.cover,
                  placeholder: 'assets/images/loader1.gif',
                  image: image,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CategoryNews(categoryName: categoryName),
                const SizedBox(height: 10),
                TimeOfNews(timeAndDate: timeAndDate),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
