abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetArticlesLoadingState extends NewsStates {}

class NewsGetArticlesSuccessState extends NewsStates {}

class NewsGetArticlesErrorState extends NewsStates
{
  final String error;
  NewsGetArticlesErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates
{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates
{
  final String error;
  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates
{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates
{
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsAppChangeModeState extends NewsStates {}