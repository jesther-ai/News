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
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
      color: HexColor('#8855d7'),
      child: Container(
        color: HexColor('#f8f6fc'),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Consumer<News>(
            builder: (context, value, child) {
              return value.isLoadedTrending
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          duration: const Duration(milliseconds: 1000),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: Row(
                                children: [
                                  CategoryNews(categoryName: value.trendingArticles[0]['source']['name']),
                                  const SizedBox(width: 10),
                                  TimeOfNews(timeAndDate: value.trendingArticles[0]['publishedAt']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          duration: const Duration(milliseconds: 1000),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: Text(
                                value.trendingArticles[0]['description'],
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: Duration(milliseconds: 1000),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              child: Text(
                                'Related News',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: const Duration(milliseconds: 1000),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(5),
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: value.trendingArticles.length - 1,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return NewsListCard(
                                        image: value.trendingArticles[index + 1]['urlToImage'] ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png',
                                        title: value.trendingArticles[index + 1]['title'],
                                        categoryName: value.trendingArticles[index + 1]['source']['name'],
                                        timeAndDate: value.trendingArticles[index + 1]['publishedAt'],
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
                  : Container(
                      color: HexColor('#f8f6fc'),
                      height: 450,
                      child: Center(
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: HexColor('#8855d7'),
                            strokeWidth: 2.5,
                          ),
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
      if (!news.isLoadedTrending) news.loadTrending();
    });
  }

  onRefresh(context) {
    News news = Provider.of<News>(context, listen: false);
    news.loadTrending();
  }
}
