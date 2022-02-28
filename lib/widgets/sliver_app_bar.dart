import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/Utilities/dialog.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/providers/news_data.dart';
import 'package:news_app/providers/selected_tab.dart';
import 'package:news_app/widgets/favorite_button.dart';
import 'package:news_app/widgets/input_textfield.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NewsSliverAppBar extends StatelessWidget {
  NewsSliverAppBar({
    Key? key,
    // required this.title,
    required this.body,
    this.drawer,
    // this.imageUrl,
    required this.footer,
  }) : super(key: key);
  // final String title;
  final Widget body;
  final Widget footer;
  final Widget? drawer;
  // final String? imageUrl;
  var top = 0.0;

  bool scrolled = false;
  TextEditingController search = TextEditingController();
  FocusNode focusSearch = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double navBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          child: Scaffold(
            body: Container(
              color: Colors.white,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    Consumer2<News, SelectedTab>(
                      builder: (context, value, selectedTab, child) {
                        return SliverAppBar(
                          elevation: 0,
                          expandedHeight: selectedTab.tabIndex != 2 ? screenSize.height * 0.35 : screenSize.height * 0.15,
                          floating: false,
                          pinned: true,
                          title: selectedTab.tabIndex != 2
                              ? Center(
                                  child: HomeTitle(
                                    trendingTitle: value.trendingTitle,
                                  ),
                                )
                              : Center(child: Text(value.searchTitle)),
                          flexibleSpace: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              top = constraints.biggest.height;
                              scrolled = (top == navBarHeight);
                              return FlexibleSpaceBar(
                                centerTitle: true,
                                titlePadding: const EdgeInsets.only(bottom: 0),
                                title: Stack(
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      decoration: BoxDecoration(
                                        boxShadow: (top == navBarHeight)
                                            ? []
                                            : [
                                                BoxShadow(
                                                  color: HexColor('#8855d7'),
                                                  spreadRadius: 50,
                                                  blurRadius: 150,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                        color: HexColor('#f8f6fc'),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(65),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      height: (top == navBarHeight) ? 0 : 45,
                                    ),
                                    selectedTab.tabIndex != 2 && top != navBarHeight
                                        ? Positioned(
                                            left: 10,
                                            bottom: 10,
                                            child: value.trendingArticles.isEmpty
                                                ? AnimationConfiguration.staggeredList(
                                                    position: 0,
                                                    duration: const Duration(milliseconds: 1000),
                                                    child: FadeInAnimation(
                                                      child: SlideAnimation(
                                                        verticalOffset: 100,
                                                        child: SizedBox(
                                                          width: screenSize.width * 0.60,
                                                          child: const Text(
                                                            'Fetching, Please wait...',
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : AnimationConfiguration.staggeredList(
                                                    position: 0,
                                                    duration: const Duration(milliseconds: 1000),
                                                    child: FadeInAnimation(
                                                      child: SlideAnimation(
                                                        verticalOffset: 100,
                                                        child: SizedBox(
                                                          width: screenSize.width * 0.60,
                                                          child: Text(
                                                            value.trendingArticles[0]['title'],
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: const TextStyle(
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          )
                                        : const SizedBox(),
                                    selectedTab.tabIndex == 2 && top != navBarHeight
                                        ? Positioned(
                                            child: InputTextField(
                                              controller: search,
                                              focusNode: focusSearch,
                                              hintText: 'Search Here',
                                              padding: const EdgeInsets.only(left: 20),
                                              floatingLabelBehavior: FloatingLabelBehavior.never,
                                              suffixIcon: Icon(Icons.search_outlined, color: HexColor('#8855d7')),
                                              onEditingComplete: () {
                                                value.searchNews(search.text);
                                                focusSearch.unfocus();
                                              },
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                background: selectedTab.tabIndex != 2 && value.trendingArticles.isNotEmpty
                                    ? Hero(
                                        tag: value.trendingArticles[0]['urlToImage'],
                                        transitionOnUserGestures: true,
                                        child: FadeInImage.assetNetwork(
                                          fadeInCurve: Curves.easeInQuart,
                                          fadeOutCurve: Curves.easeInQuart,
                                          fadeOutDuration: const Duration(milliseconds: 1000),
                                          fadeInDuration: const Duration(milliseconds: 200),
                                          fit: BoxFit.cover,
                                          width: 110,
                                          height: 150,
                                          placeholderFit: BoxFit.cover,
                                          placeholder: 'assets/images/loader3.gif',
                                          image: value.trendingArticles[0]['urlToImage'],
                                        ),
                                      )
                                    : const SizedBox(),
                              );
                            },
                          ),
                          backgroundColor: HexColor('#8855d7'),
                          iconTheme: const IconThemeData(color: Colors.black),
                        );
                      },
                    ),
                  ];
                },
                body: SafeArea(
                  top: false,
                  bottom: false,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              body,
                              Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minHeight: 50,
                                          minWidth: double.infinity,
                                          maxHeight: 200.0,
                                          maxWidth: double.infinity,
                                        ),
                                        child: footer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.95),
        );
      },
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    required this.trendingTitle,
    Key? key,
  }) : super(key: key);
  final String trendingTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(trendingTitle),
        const SizedBox(width: 55),
        Row(
          children: [
            FavoriteButton(iconData: Icons.bookmark_border, iconColor: Colors.white, buttonColor: HexColor('#8855d7'), onTap: () {}),
            const SizedBox(width: 20),
            FavoriteButton(iconData: Icons.filter_alt_outlined, iconColor: HexColor('#8855d7'), buttonColor: Colors.white, onTap: () => filterDialog(context)),
          ],
        ),
      ],
    );
  }
}
