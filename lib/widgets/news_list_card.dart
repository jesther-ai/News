import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/category_news_card.dart';
import 'package:news_app/widgets/time_of_news_card.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({
    Key? key,
  }) : super(key: key);

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
                  color: Colors.transparent,
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
                child: Image.network(
                  'https://www.presse-citron.net/app/uploads/2021/12/Block-Square-Fintech.jpg',
                  fit: BoxFit.cover,
                  width: 110,
                  height: 150,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(
                  child: Text(
                    'Pierre Noizat, Paymium : « Le Bitcoin est bon pour l’environnement »',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CategoryNews(categoryName: 'BBC News'),
                SizedBox(height: 10),
                TimeOfNews(timeAndDate: '10:40AM - September 20, 2022'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
