import 'package:flutter/material.dart';
import 'package:news_app/providers/news_data.dart';
import 'package:news_app/providers/selected_tab.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<News>(create: (context) => News()),
        ChangeNotifierProvider<SelectedTab>(create: (context) => SelectedTab()),
      ],
      child: MaterialApp(
        darkTheme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
