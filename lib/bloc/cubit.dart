import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pojo/bloc/states.dart';
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/models/sources_response.dart';
import 'package:news_pojo/repository/home_repo_interface.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourcesResponse? sourcesResponse;
  NewsResponse? newsResponse;
  int selectedTabIndex = 0;
  String? query;
  String lastQuery = '';
  HomeRepoInterface homeRepoInterface;

  HomeCubit(this.homeRepoInterface) : super(HomeInitState());
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
     sourcesResponse = await homeRepoInterface.getSources(categoryName);
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
     newsResponse = await homeRepoInterface.getArticles(
          sourcesResponse?.sources?[selectedTabIndex].id ?? 'abc-news');
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
    newsResponse = await homeRepoInterface.getSearch(query ?? 'abc-news');
      if (newsResponse?.status == 'ok') {
        emit(GetSearchSuccessState());
      } else {
        emit(GetSearchErrorState(newsResponse?.message ?? ''));
      }
    } catch (e) {
      emit(GetSearchErrorState(e.toString()));
    }
  }
}
