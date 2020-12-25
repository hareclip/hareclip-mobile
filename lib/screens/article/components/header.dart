import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article/components/sharing.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// ArticleHeader is article screen header
class ArticleHeader extends StatelessWidget {
  final Article article;

  ArticleHeader({
    Key key,
    @required this.article,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: null, // TODO: add bookmarking
                    ),
                    IconButton(
                      icon: Icon(Icons.ios_share),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => SharingActionSheet(
                            article: article,
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
