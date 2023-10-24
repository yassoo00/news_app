import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/article_item/article_item.dart';

import '../../shared/components/components.dart';

class ArticleBuilder extends StatelessWidget {
  bool isSearch;
  final List<Article> list;
  ArticleBuilder({Key? key, required this.list, this.isSearch=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (BuildContext context)=>ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index)=>ArticleItem(article:list[index]),
        separatorBuilder: (BuildContext context, int index)=>separator(),
        itemCount: list.length,
      ),
      fallback: (BuildContext context)=> isSearch? const Center(child:Text('There is no result')):const Center(child: CircularProgressIndicator()),
    );
  }
}
