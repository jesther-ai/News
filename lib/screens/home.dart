import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/providers/news_data.dart';
import 'package:news_app/widgets/news_item.dart';
import 'package:news_app/widgets/top_menu_item.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<News>(context, listen: false).load();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: HexColor('#666666'),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'News',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 26,
            color: HexColor('#666666'),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: const <Widget>[
                  TopMenuItem(title: 'Sports'),
                  TopMenuItem(title: 'Business'),
                  TopMenuItem(title: 'Arts'),
                  TopMenuItem(title: 'Science'),
                  TopMenuItem(title: 'Apple'),
                  TopMenuItem(title: 'Android'),
                  TopMenuItem(title: 'Crypto'),
                ],
              ),
            ),
            Consumer<News>(
              builder: (context, value, child) {
                return Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: value.isLoaded
                        ? CarouselSlider.builder(
                            options: CarouselOptions(
                              // initialPage:
                              //     (value.articles.length * 0.50).toInt(),
                              enlargeCenterPage: true,
                              height: size.height,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemCount: value.articles.length,
                            itemBuilder: (context, index, currentIndex) {
                              return NewsCard(
                                title: value.articles[index]['title'] ??= '',
                                description: value.articles[index]
                                    ['description'] ??= '',
                                imageSource: value.articles[index]
                                    ['urlToImage'],
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: HexColor('#666666'),
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
