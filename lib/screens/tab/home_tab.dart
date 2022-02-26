import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/category_news_card.dart';
import 'package:news_app/widgets/time_of_news_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: const [
              CategoryNews(categoryName: 'BBC News'),
              SizedBox(width: 10),
              TimeOfNews(timeAndDate: '10:40AM - September 20, 2022'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Image source, Getty Images\r\nBitcoin has become less green since China cracked down on mining the cryptocurrency, new research suggests.\r\nMining refers to the process of creating new bitcoins using ba…',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: HexColor('#7D9297'),
            ),
          ),
        ],
      ),
    );
  }
}
