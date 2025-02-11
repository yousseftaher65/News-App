import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/core/constants/config.dart';
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/models/sources_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourcesResponse? sourcesResponse;
  NewsResponse? newsResponse;
  int selectedTabIndex = 0;
  String? query;
  String lastQuery = '';

  HomeCubit() : super(HomeInitState());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  void changeSelectedTab(int index) async {
    selectedTabIndex = index;
    await getArticles();
    emit(ChangeSelectedTab());
  }

  Future<void> performSearch(String search) async {
    query = search;
    if (search.isEmpty) {
      await getArticles();

      emit(GetSearchSuccessState());
    } else {
      await getSearch();
    }
  }

  /// Checks if the current text is non-empty and different from the last search.
  void maybePerformSearch() {
    final currentQuery = query?.trim() ?? '';
    if (currentQuery == lastQuery) return;
    lastQuery = currentQuery;
    performSearch(currentQuery);
  }

  void getSources(String categoryName) async {
    try {
      emit(GetSourcesLoadingState());
      Uri url = Uri.https(ApiManager.baseUrl, ApiManager.topHeadlines,
          {'category': categoryName, 'apiKey': apiKey});
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      sourcesResponse = SourcesResponse.fromJson(jsonData);
      if (sourcesResponse?.status == 'ok') {
        await getArticles();
        emit(GetSourcesSuccessState());
      } else {
        emit(GetSourcesErrorState(sourcesResponse?.message ?? ''));
      }
    } catch (e) {
      emit(GetSourcesErrorState(e.toString()));
    }
  }

  Future<void> getArticles() async {
    try {
      emit(GetArticalsLoadingState());
      Uri url = Uri.https(ApiManager.baseUrl, ApiManager.everything, {
        'apiKey': apiKey,
        "sources": sourcesResponse?.sources?[selectedTabIndex].id ?? 'abc-news'
      });
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      newsResponse = NewsResponse.fromJson(jsonData);
      if (newsResponse?.status == 'ok') {
        emit(GetArticalsSuccessState());
      } else {
        emit(GetArticalsErrorState(newsResponse?.message ?? ''));
      }
    } catch (e) {
      emit(GetArticalsErrorState(e as String));
    }
  }

  Future<void> getSearch() async {
    try {
      emit(GetSearchLoadingState());
      Uri url = Uri.https(ApiManager.baseUrl, ApiManager.everything,
          {'q': query ?? 'abc-news', 'apiKey': apiKey});
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      newsResponse = NewsResponse.fromJson(jsonData);
     if(newsResponse?.status == 'ok'){
       emit(GetSearchSuccessState());
       }else{
        emit(GetSearchErrorState(newsResponse?.message??''));
       }
    } catch (e) {
      emit(GetSearchErrorState(e.toString()));
    }
  }
}
