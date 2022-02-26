import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';
import 'package:news_app/widgets/sliver_app_bar.dart';

import '../widgets/home_footer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: NewsSliverAppBar(
        body: const HomeBody(),
        imageUrl: 'https://github.com/jesther-ai/magazine_v1.1/raw/master/screenshot/sampleV2.png?raw=true',
        footer: const HomeFooter(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#DBF9FF'),
      child: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }
}
