import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/services/api.dart';

// ArticleContent displays content of article
class ArticleContent extends StatelessWidget {
  final Article article;

  ArticleContent({Key key, @required this.article}) : super(key: key);

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchArticleContent(article.contentsFileName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MarkdownBody(data: snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
            child: Icon(Icons.error),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
