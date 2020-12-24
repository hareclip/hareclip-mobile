import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';

// ArticleTitle displays article title and author
class ArticleTitle extends StatelessWidget {
  final Article article;

  ArticleTitle({Key key, @required this.article}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.categoryLabel),
        Padding(
          padding: const EdgeInsets.only(
            left: 0,
            top: 0,
            right: 0,
            bottom: 10,
          ),
          child: Text(
            article.title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 0,
            top: 0,
            right: 0,
            bottom: 10,
          ),
          child: Text(
            "By: " + article.authorFullName,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
