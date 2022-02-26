import 'package:flutter/material.dart';
import 'package:news_app/widgets/sliver_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsSliverAppBar(
      body: Text('body'),
      imageUrl: 'https://github.com/jesther-ai/magazine_v1.1/raw/master/screenshot/sampleV2.png?raw=true',
      footer: Text('Footer'),
    );
  }
}
