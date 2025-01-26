import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/models/sources_response.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String topHeadlines = '/v2/top-headlines/sources';
  static const String apiKey = '3c5ed2223f90423aa4df21aa3421b5e2';

  static Future<SourcesResponse> getSources(String categoryName) async {
    Uri url = Uri.https(baseUrl, topHeadlines,{'category':categoryName,'apiKey': apiKey});
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
      return sourcesResponse;
    } else {
      throw Exception(
          '========================== Failed to load sources ==========================');
    }
  }

  static Future<NewsResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(
        baseUrl, "/v2/everything", {'apiKey': apiKey, "sources": sourceId});
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
      return newsResponse;
    } else {
      throw Exception(
          '========================== Failed to load sources ==========================');
    }
  }
}
