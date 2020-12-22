import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hareclip/models/article.dart';

Future<List<Article>> fetchArticles() async {
  http.Response response = await http
      .get(Uri.encodeFull("https://www.umdhare.com/api/articles?amount=6"));

  Map<String, dynamic> data = jsonDecode(response.body);
  var list = data['data']['articles'] as List;
  List<Article> articles = list.map((e) => Article.fromJson(e)).toList();
  return articles;
}
