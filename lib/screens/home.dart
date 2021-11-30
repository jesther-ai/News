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
    Provider.of<News>(context, listen: false).load('latest');
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
            Flexible(
              child: Consumer<News>(
                builder: (context, value, child) {
                  return AnimatedCrossFade(
                    crossFadeState: value.isLoadedBool
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                    firstChild: Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: size.height,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: value.data.length,
                        itemBuilder: (context, index, currentIndex) {
                          return NewsCard(
                            title: value.data[index]['title'] ??= '',
                            description: value.data[index]['description'] ??=
                                '',
                            imageSource: value.data[index]['urlToImage'] ??=
                                'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg',
                          );
                        },
                      ),
                    ),
                    secondChild: const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 3,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
