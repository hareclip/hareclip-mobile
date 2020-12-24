import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/services/api.dart';

class ArticleScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Article'),
        ),
        body: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                      Divider(
                        color: Colors.black,
                      ),
                      FutureBuilder(
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
                      ),
                    ],
                  ),
                )),
          );
        }));
  }
}
