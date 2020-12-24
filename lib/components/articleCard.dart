import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({Key key, @required this.article}) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/article', arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 0,
          right: 10,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                top: 10,
                right: 0,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
