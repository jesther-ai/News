import 'package:flutter/material.dart';
import 'package:news_app/screens/tab/account_tab.dart';
import 'package:news_app/screens/tab/home_tab.dart';
import 'package:news_app/screens/tab/list_tab.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const TabBarView(
        children: [
          AccountTab(),
          HomeTab(),
          ListTab(),
          SizedBox(),
        ],
      ),
    );
  }
}
