import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article/components/content.dart';
import 'package:hareclip/screens/article/components/header.dart';
import 'package:hareclip/screens/article/components/title.dart';
import 'package:hareclip/services/api.dart';

// ArticleScreen displays single article
class ArticleScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ArticleHeader(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CachedNetworkImage(
                              imageUrl: getHeaderImageURL(
                                  article.headerImageFileName),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
