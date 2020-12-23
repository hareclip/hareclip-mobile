import 'dart:async';
import 'dart:convert';
import 'dart:io' as Io;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as im;
import 'package:hareclip/models/article.dart';

// Fetches list of article metadata
Future<List<Article>> fetchArticles() async {
  var apiURL = DotEnv().env['API_URL'];
  http.Response response =
      await http.get(Uri.encodeFull("$apiURL/articles?amount=6"));

  Map<String, dynamic> data = jsonDecode(response.body);
  var list = data['data']['articles'] as List;
  List<Article> articles = list.map((e) => Article.fromJson(e)).toList();
  return articles;
}

// Fetches article content
Future<String> fetchArticleContent(String path) async {
  var s3URL = DotEnv().env['S3_URL'];
  http.Response response = await http.get(Uri.encodeFull("$s3URL/res/$path"));

  var text = utf8.decode(response.bodyBytes);
  return text;
}

// Fetches article content
Future<void> fetchHeaderImage(String path) async {
  var s3URL = DotEnv().env['S3_URL'];
  http.Response response = await http.get(Uri.encodeFull("$s3URL/res/$path"));

  im.Image image = im.decodeImage(response.bodyBytes);
  //new Io.File('assets/test.jpg').writeAsBytes(response.bodyBytes);
}
