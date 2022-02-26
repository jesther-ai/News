import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/category_news_card.dart';
import 'package:news_app/widgets/news_list_card.dart';
import 'package:news_app/widgets/time_of_news_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Container(
        color: HexColor('#f8f6fc'),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                'Image source, Getty Images\r\nBitcoin has become less green since China cracked down on mining the cryptocurrency, new research suggests.\r\nMining refers to the process of creating new bitcoins using ba…',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Hot News',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 500),
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const NewsListCard();
                          },
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
