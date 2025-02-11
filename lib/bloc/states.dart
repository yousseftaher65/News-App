abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {
  String error;
  GetSourcesErrorState(this.error);
}

class GetArticalsLoadingState extends HomeStates {}

class GetArticalsSuccessState extends HomeStates {}

class GetArticalsErrorState extends HomeStates {
  String error;
  GetArticalsErrorState(this.error);
}

class GetSearchLoadingState extends HomeStates {}

class GetSearchSuccessState extends HomeStates {}

class GetSearchErrorState extends HomeStates {
  String error;
  GetSearchErrorState(this.error);
}

class ChangeSelectedTab extends HomeStates {}
