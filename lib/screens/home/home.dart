import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home_body.dart';
import 'package:news_app/screens/home/home_footer.dart';

import 'package:news_app/widgets/sliver_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: NewsSliverAppBar(
        body: const HomeBody(),
        footer: const HomeFooter(),
      ),
    );
  }
}
