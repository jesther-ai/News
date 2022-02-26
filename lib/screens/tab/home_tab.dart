import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/providers/news_data.dart';
import 'package:news_app/widgets/category_news_card.dart';
import 'package:news_app/widgets/news_list_card.dart';
import 'package:news_app/widgets/time_of_news_card.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initState(context);
    return AnimationLimiter(
      child: Container(
        color: HexColor('#f8f6fc'),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Consumer<News>(
            builder: (context, value, child) {
              return value.isLoaded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CategoryNews(categoryName: value.data[0]['source']['name']),
                            const SizedBox(width: 10),
                            TimeOfNews(timeAndDate: value.data[0]['publishedAt']),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          value.data[0]['description'],
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Related News',
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
                                    itemCount: value.data.length - 1,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return NewsListCard(
                                        image: value.data[index + 1]['urlToImage'],
                                        title: value.data[index + 1]['title'],
                                        categoryName: value.data[index + 1]['source']['name'],
                                        timeAndDate: value.data[index + 1]['publishedAt'],
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 120),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: HexColor('#FF715B'),
                          strokeWidth: 2.5,
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      News news = Provider.of<News>(context, listen: false);
      if (!news.isLoaded) news.load('Ukraine');
    });
  }
}
