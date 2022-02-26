import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

// ignore: must_be_immutable
class NewsSliverAppBar extends StatelessWidget {
  NewsSliverAppBar({
    Key? key,
    required this.body,
    this.drawer,
    this.imageUrl,
    required this.footer,
  }) : super(key: key);

  final Widget body;
  final Widget footer;
  final Widget? drawer;
  final String? imageUrl;

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
                      expandedHeight: screenSize.height * 0.45,
                      floating: false,
                      pinned: true,
                      flexibleSpace: LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
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
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(65),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  height: (top == navBarHeight) ? 45 : 45,
                                ),
                                Positioned(
                                  left: 30,
                                  bottom: 30,
                                  child: FavoriteButton(
                                    iconData: Icons.favorite_border_rounded,
                                    iconColor: HexColor('#8855d7'),
                                    buttonColor: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  left: 70,
                                  bottom: 30,
                                  child: FavoriteButton(
                                    iconData: Icons.bookmark_border,
                                    iconColor: Colors.white,
                                    buttonColor: HexColor('#8855d7'),
                                  ),
                                ),
                              ],
                            ),
                            background: Hero(
                              tag: imageUrl!,
                              transitionOnUserGestures: true,
                              child: Image.network(
                                imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      backgroundColor: HexColor('#DBF9FF'),
                      iconTheme: const IconThemeData(
                        color: Colors.black, //change your color here
                      ),
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

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.iconData,
    required this.buttonColor,
    required this.iconColor,
    Key? key,
  }) : super(key: key);
  final Color iconColor;
  final Color buttonColor;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: iconColor,
          size: 15,
        ),
      ),
    );
  }
}
