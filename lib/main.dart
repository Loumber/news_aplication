import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_ant_project/bloc/news/news_bloc.dart';
import 'package:web_ant_project/bloc/news_details/news_details_bloc.dart';
import 'package:web_ant_project/screens/news/news_screen.dart';
import 'package:web_ant_project/services/news_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final dio = Dio();
  late final newsService = NewsService(dio);


  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(
      create: (context) => NewsBloc(NewsService(Dio()))..add(LoadNews()),
      child:  BlocProvider(
        create: (context) => NewsDetailsBloc(newsService: newsService)
      ,child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NewsScreen(),
      ),
      )
    );
  }
}
