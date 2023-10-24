import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubits/cubit.dart';
import '../../shared/cubit/states/states.dart';
import '../article_builder/article_builder.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextField(
                    control: searchController,
                    text: 'Search',
                    prefix: Icons.search,
                    validate: (value)
                    {
                      if(value.isEmpty)
                        return'Empty field';

                      return null;
                    },
                    onChange: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(
                child: ArticleBuilder(list: list,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
