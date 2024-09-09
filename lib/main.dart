//~ e9a99dba9ecbc9ba67dce9b36b508ab3
//~ eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOWE5OWRiYTllY2JjOWJhNjdkY2U5YjM2YjUwOGFiMyIsIm5iZiI6MTcyNTg3MzAwMi43MTU0ODYsInN1YiI6IjY2ZGViYTY3OGZjZWFkYWE4ZTNhZGI1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PQRFUpo37BSqzK-u0p12dem4TolxzJQQWrMhga941eE

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [], topRatedMovies = [], tv = [];
  final String apiKey = 'e9a99dba9ecbc9ba67dce9b36b508ab3';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOWE5OWRiYTllY2JjOWJhNjdkY2U5YjM2YjUwOGFiMyIsIm5iZiI6MTcyNTg3MzAwMi43MTU0ODYsInN1YiI6IjY2ZGViYTY3OGZjZWFkYWE4ZTNhZGI1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PQRFUpo37BSqzK-u0p12dem4TolxzJQQWrMhga941eE';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
    );
    logConfig:
    const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    );

    try {
      Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending(),
          topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated(),
          tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
      print(trendingResult);
      setState(() {
        trendingMovies = trendingResult['results'];
        topRatedMovies=topRatedResult['results'];
        tv=tvResult['results'];
      });
      print(trendingMovies);
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Movie App'),
      ),
    );
  }
}
