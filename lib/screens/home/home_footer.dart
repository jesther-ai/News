import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 25),
      height: 110,
      child: Center(
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.only(left: 20, right: 20),
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          labelColor: HexColor('#8855d7'),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: HexColor('#7D9297'),
          ),
          unselectedLabelColor: HexColor('#7D9297'),
          indicatorColor: HexColor('#8855d7'),
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: HexColor('#006B83'),
          ),
          isScrollable: true,
          tabs: const [
            Tab(child: Text('Account'), icon: Icon(Icons.person_outline)),
            Tab(child: Text('Hot'), icon: Icon(Icons.trending_up)),
            Tab(child: Text('Search'), icon: Icon(Icons.search_rounded)),
            Tab(child: Text('Favorites'), icon: Icon(Icons.favorite_border_rounded)),
          ],
        ),
      ),
    );
  }
}
