import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/shared/components/constants.dart';
import '../../network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';
import '../states/states.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);

  bool isDark = false;
  void changeMode({bool? fromShared,})
  {
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(NewsAppChangeModeState());
      }
    else
      {
        isDark=!isDark;
        CacheHelper.putData(key: 'isDark', value: isDark).then((value)
        {
          emit(NewsAppChangeModeState());
        });
      }
  }

  getDateFormat({date,format="yyyy-MM-dd hh:mm a",fromFormat="yyyy-MM-dd'T'HH:mm:ss'Z'"})
  {
    return DateFormat(format).format(DateFormat(fromFormat).parse(date)).toString();
  }


  String? selectedArticlesCategory;
  String? selectedArticlesCountryCode;
  String? selectedArticlesCountryName;
  List<Article> articles=[];
  void getArticles({
    String? category,
    String? country,
  })async
  {
    articles=[];
    if(articles.isEmpty)
      {
        emit(NewsGetArticlesLoadingState());
        await DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
              'country':country??countriesWithCodes['United States of America'],
              'category':category??'general',
            'apiKey':apiKey,
          },
        ).then((value)
        {
          for(var element in value.data['articles']) {
            Article article=Article.fromJson(element, getDateFormat(date: element['publishedAt'] ?? ''));
            articles.add(article);
          }
          emit(NewsGetArticlesSuccessState());
        }).catchError((error)
        {
          debugPrint('error in api => ');
          debugPrint(error.toString());
          emit(NewsGetArticlesErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsGetArticlesSuccessState());
      }
  }

  List<Article> search=[];
  void getSearch(String value)async
  {
    search=[];
    await DioHelper.getData(
      url: 'v2/everything',
      query:{
        'q': value,
        'apiKey':apiKey,
      },
    ).then((value)
    {
      for(var element in value.data['articles']) {
        Article article=Article.fromJson(element, getDateFormat(date: element['publishedAt'] ?? ''));
        search.add(article);
      }
      debugPrint(search.toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      debugPrint('error in api => ');
      debugPrint(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}