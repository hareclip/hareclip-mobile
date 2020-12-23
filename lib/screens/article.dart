import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hareclip/models/articleArguments.dart';
import 'package:hareclip/services/api.dart';

class ArticleScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ArticleArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Article'),
        ),
        body: Column(children: <Widget>[
          
          Expanded(
            child: FutureBuilder(
              future: fetchArticleContent(args.contentsFileName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(data: snapshot.data);
                } else if (snapshot.hasError) {
                  return Text('error');
                } else {
                  return Text('waiting');
                }
              },
            ),
          ),
        ]));
  }
}
