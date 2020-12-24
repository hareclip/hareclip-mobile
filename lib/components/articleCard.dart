import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article/article.dart';

// ArticleCard displays article preview card
class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({Key key, @required this.article}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 5,
        right: 10,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/article', arguments: article);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 0,
                top: 10,
                right: 0,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(article.categoryLabel),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      top: 10,
                      right: 0,
                      bottom: 0,
                    ),
                    child: Text(
                      article.authorFullName,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
