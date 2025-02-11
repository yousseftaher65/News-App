import 'dart:convert';

import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/core/constants/config.dart';
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/models/sources_response.dart';
import 'package:news_pojo/repository/home_repo_interface.dart';
import 'package:http/http.dart' as http;

class HomeRepo implements HomeRepoInterface {
  @override
  Future<SourcesResponse> getSources(String categoryName) async {
    Uri url = Uri.https(ApiManager.baseUrl, ApiManager.topHeadlines,
        {'category': categoryName, 'apiKey': apiKey});
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
    return sourcesResponse;
  }

  @override
  Future<NewsResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(ApiManager.baseUrl, ApiManager.everything,
        {'apiKey': apiKey, "sources": sourceId});
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
    return newsResponse;
  }
  
  @override
  Future<NewsResponse> getSearch(String query) async {
    Uri url = Uri.https(ApiManager.baseUrl, ApiManager.everything,
        {'q': query, 'apiKey': apiKey});
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
    return newsResponse;
  }
}
