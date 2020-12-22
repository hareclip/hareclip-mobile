import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<Article>> futureArticles;

  HomeScreen({Key key, @required this.futureArticles}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var article = snapshot.data[index];
                return ArticleCard(article: article);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}