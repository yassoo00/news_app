import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/articles/articles_screen.dart';
import 'package:news_app/modules/country_filter/country_news_filter_module.dart';
import 'package:news_app/modules/news_filter/news_filter_module.dart';
import '../../shared/cubit/cubits/cubit.dart';
import '../../shared/cubit/states/states.dart';
import '../modules/search/search_screen.dart';
import '../shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state){},
        builder: (context,state)=>Scaffold(
        appBar: AppBar(
          title: Text(
            NewsCubit.get(context).selectedArticlesCategory??'general',
            ),
          actions: [
            IconButton(
                onPressed: ()
                {
                  navigateTo(
                      context,
                      SearchScreen()
                  );
                },
                icon: const Icon(
                  Icons.search,
                )
            ),
            IconButton(
                onPressed: ()
                {
                  NewsCubit.get(context).changeMode();
                },
                icon: const Icon(
                  Icons.brightness_6_outlined,
                )
            ),
          ],
        ),
        body:Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top:50.0),
                child: ArticlesScreen(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsFilter(),
                      CountryNewsFilter(),
                    ],
                  ),
                ),
              ),
            ]
        ),
        ),
    );
  }
}
