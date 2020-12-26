import 'dart:convert';

import 'package:hareclip/models/article.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> _getSavedArticleData(SharedPreferences prefs) {
  List<dynamic> savedArticlesData = [];
  if (prefs.containsKey("saved_articles") != null &&
      prefs.get("saved_articles") != null) {
    savedArticlesData = json.decode(
      prefs.get("saved_articles"),
    );
  }
  return savedArticlesData;
}

// saveArticle saves article to shared preferences
bool saveArticle(SharedPreferences prefs, Article article) {
  List<dynamic> savedArticlesData = _getSavedArticleData(prefs);

  // Check if id in list
  for (var data in savedArticlesData) {
    Article currArticle = Article.fromJson(data);
    if (currArticle.id == article.id) {
      return false;
    }
  }

  savedArticlesData.add(article.toJson());
  prefs.setString(
    "saved_articles",
    json.encode(savedArticlesData),
  );
  return true;
}

// unsaveArticle unsaves article
bool unsaveArticle(SharedPreferences prefs, Article article) {
  List<dynamic> savedArticlesData = _getSavedArticleData(prefs);

  // Check if id in list
  for (int i = 0; i < savedArticlesData.length; i++) {
    var data = savedArticlesData[i];
    Article currArticle = Article.fromJson(data);
    if (currArticle.id == article.id) {
      savedArticlesData.removeAt(i);
      prefs.setString(
        "saved_articles",
        json.encode(savedArticlesData),
      );
      return true;
    }
  }

  return false;
}

// isArticleSaved checks if article was saved
bool isArticleSaved(SharedPreferences prefs, Article article) {
  List<dynamic> savedArticlesData = _getSavedArticleData(prefs);
  for (var data in savedArticlesData) {
    Article currArticle = Article.fromJson(data);
    if (currArticle.id == article.id) {
      return true;
    }
  }
  return false;
}

// getSavedArticles gets list of saved articles
List<Article> getSavedArticles(SharedPreferences prefs) {
  List<dynamic> savedArticlesData = _getSavedArticleData(prefs);
  return savedArticlesData.map((data) => Article.fromJson(data)).toList();
}

// clearSavedArticles clears all saved articles
void clearSavedArticles(SharedPreferences prefs) {
  prefs.setString(
    "saved_articles",
    json.encode([]),
  );
}
