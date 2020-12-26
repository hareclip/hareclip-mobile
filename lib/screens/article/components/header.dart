import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/article/components/sharing.dart';
import 'package:hareclip/services/articleSaving.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ArticleHeader is article screen header
class ArticleHeader extends StatefulWidget {
  final Article article;
  final SharedPreferences prefs;

  ArticleHeader({
    Key key,
    @required this.article,
    @required this.prefs,
  }) : super(key: key);

  @override
  _ArticleHeaderState createState() => _ArticleHeaderState();
}

class _ArticleHeaderState extends State<ArticleHeader> {
  SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = widget.prefs;
  }

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
                      icon: Icon(
                        isArticleSaved(_prefs, widget.article)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isArticleSaved(_prefs, widget.article)) {
                            unsaveArticle(_prefs, widget.article);
                          } else {
                            saveArticle(_prefs, widget.article);
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.ios_share),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => SharingActionSheet(
                            article: widget.article,
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
