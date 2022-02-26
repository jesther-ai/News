import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/favorite_button.dart';

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
                    SliverAppBar(
                      elevation: 0,
                      expandedHeight: screenSize.height * 0.35,
                      floating: false,
                      pinned: true,
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
                                top != navBarHeight
                                    ? Positioned(
                                        right: 20,
                                        bottom: 35,
                                        child: FavoriteButton(
                                          iconData: Icons.favorite_border_rounded,
                                          iconColor: HexColor('#8855d7'),
                                          buttonColor: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(),
                                top != navBarHeight
                                    ? Positioned(
                                        right: 55,
                                        bottom: 35,
                                        child: FavoriteButton(
                                          iconData: Icons.bookmark_border,
                                          iconColor: Colors.white,
                                          buttonColor: HexColor('#8855d7'),
                                        ),
                                      )
                                    : const SizedBox(),
                                top != navBarHeight
                                    ? Positioned(
                                        left: 10,
                                        bottom: 0,
                                        child: SizedBox(
                                          width: screenSize.width * 0.60,
                                          child: const Text(
                                            'Bitcoin less green since China ban, research suggests',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            background: Hero(
                              tag: 'https://ichef.bbci.co.uk/news/1024/branded_news/17EC7/production/_123419979_coalplantgettyimages-948004144.jpg',
                              transitionOnUserGestures: true,
                              child: Image.network(
                                'https://ichef.bbci.co.uk/news/1024/branded_news/17EC7/production/_123419979_coalplantgettyimages-948004144.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      backgroundColor: HexColor('#8855d7'),
                      iconTheme: const IconThemeData(color: Colors.black),
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
