import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article.dart';
import 'package:hareclip/screens/home.dart';
import 'package:hareclip/services/api.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/article': (context) => ArticleScreen()},
      title: 'Hareclip',
      home: HomeScreen(futureArticles: this.futureArticles),
    );
  }
}
