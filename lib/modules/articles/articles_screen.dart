import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/article_builder/article_builder.dart';

import '../../shared/cubit/cubits/cubit.dart';
import '../../shared/cubit/states/states.dart';


class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) {},
      builder: ( context,state)
      {
        var list = NewsCubit.get(context).articles;
        return ArticleBuilder(list:list,);
      },
    );
  }

}