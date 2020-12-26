import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/saved/components/header.dart';
import 'package:hareclip/services/articleSaving.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SavedScreen displays saved articles
class SavedScreen extends StatefulWidget {
  final SharedPreferences prefs;

  SavedScreen({Key key, this.prefs}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  SharedPreferences _prefs;
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    _prefs = widget.prefs;
    setState(() {
      _articles = getSavedArticles(_prefs);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SavedHeader(),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  return ArticleCard(
                    article: _articles[index],
                    onArticleClick: () {
                      Navigator.pushNamed(context, '/article',
                              arguments: _articles[index])
                          .then((value) => setState(() {
                                _articles = getSavedArticles(_prefs);
                              }));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
