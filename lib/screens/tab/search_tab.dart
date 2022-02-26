import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#f8f6fc'),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    );
  }
}
