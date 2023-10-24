import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/modules/filter_widget/filter_widget.dart';
import 'package:news_app/shared/cubit/cubits/cubit.dart';
import 'package:news_app/shared/cubit/states/states.dart';

class NewsFilter extends StatelessWidget {
  NewsFilter({super.key});
  List<String> items = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder:(context, state)
      {

        return FilterWidget(
          items: items,
          onChanged: (value)
          {
            NewsCubit.get(context).selectedArticlesCategory=value!;
            NewsCubit.get(context).getArticles(
                category: NewsCubit.get(context).selectedArticlesCategory,
                country: NewsCubit.get(context).selectedArticlesCountryCode
            );

          },
          selectedValue: NewsCubit.get(context).selectedArticlesCategory??'general',
          darkColor: HexColor('171733'),
          lightColor: Colors.white,
        );
      },
    );
  }
}

