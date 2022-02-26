import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/providers/news_data.dart';
import 'package:news_app/widgets/news_list_card.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#f8f6fc'),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SingleChildScrollView(
        child: Consumer<News>(
          builder: (context, value, child) {
            return value.searchResult.isNotEmpty
                ? AnimationConfiguration.staggeredList(
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
                              itemCount: value.searchResult.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return NewsListCard(
                                  image: value.searchResult[index]['urlToImage'] ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png',
                                  title: value.searchResult[index]['title'],
                                  categoryName: value.searchResult[index]['source']['name'],
                                  timeAndDate: value.searchResult[index]['publishedAt'],
                                );
                              },
                            ),
                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ),
                  )
                : !value.isLoadingSearch
                    ? Center(
                        child: SizedBox(
                          height: 450,
                          child: Text(
                            'Result will show here.',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: HexColor('#8855d7'),
                            ),
                          ),
                        ),
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
    );
  }
}
