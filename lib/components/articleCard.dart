import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/models/articleArguments.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({Key key, @required this.article}) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(article.title),
            ElevatedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/article',
                  arguments: ArticleArguments(article.contentsFileName, article.headerImageFileName),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
