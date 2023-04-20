import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/business_bloc.dart';
import 'package:news_app_bloc/bloc/news_bloc.dart';
import 'package:news_app_bloc/bloc/tech_bloc.dart';
import 'package:news_app_bloc/repositories/business_news_repo.dart';
import 'package:news_app_bloc/repositories/news_repo.dart';
import 'package:news_app_bloc/screens/splash_screen.dart';

import 'repositories/tech_news_repo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(NewsRepo())..add(NewsLoadedEvent()),
        ),
        BlocProvider<BusinessBloc>(
          create: (context) =>
              BusinessBloc(BusinessRepo())..add(BusinessLoadedEvent()),
        ),
        BlocProvider<TechBloc>(
          create: (context) => TechBloc(TechRepo())..add(TechLoadedEvent()),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
