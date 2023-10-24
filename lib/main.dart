import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubits/cubit.dart';
import 'package:news_app/shared/cubit/states/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/style/style.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main()async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized()
  );
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark')??false;
  FlutterNativeSplash.remove();
  runApp(MyApp(isDark:isDark,));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key,required this.isDark,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewsCubit()
          ..getArticles()
          ..changeMode(fromShared: isDark)
        ),
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
