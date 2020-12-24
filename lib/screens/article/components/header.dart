import 'package:flutter/material.dart';

// ArticleHeader is article screen header
class ArticleHeader extends StatelessWidget {
  ArticleHeader({
    Key key,
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
                      onPressed: null, // TODO: add sharing
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
