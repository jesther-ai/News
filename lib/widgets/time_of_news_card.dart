import 'package:flutter/material.dart';
import 'package:news_app/Utilities/hex_color.dart';

class TimeOfNews extends StatelessWidget {
  const TimeOfNews({
    required this.timeAndDate,
    Key? key,
  }) : super(key: key);
  final String timeAndDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.timer_outlined,
          color: HexColor('#7D9297'),
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          timeAndDate,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            color: HexColor('#7D9297'),
          ),
        )
      ],
    );
  }
}
