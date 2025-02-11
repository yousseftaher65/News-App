import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/models/sources_response.dart';

abstract class HomeRepoInterface {
  Future<SourcesResponse> getSources(String categoryId);
  Future<NewsResponse> getArticles(String sourceId);
  Future<NewsResponse> getSearch(String query);
}
