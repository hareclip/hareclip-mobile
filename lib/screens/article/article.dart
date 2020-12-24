import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article/components/content.dart';
import 'package:hareclip/screens/article/components/title.dart';

// ArticleScreen displays single article
class ArticleScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, viewportConstraints) {
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
                      ArticleTitle(
                        article: article,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      ArticleContent(
                        article: article,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
