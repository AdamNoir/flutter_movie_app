import 'package:flutter/material.dart';
import 'package:movie_app/utils/custom_text.dart';
import 'package:movie_app/widgets/popular_tv_shows.dart';
import 'package:movie_app/widgets/top_rated_movies.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.blue),
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

  // Atributos
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = 'b7de7590d9d3c361c329fe94fc8138af';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiN2RlNzU5MGQ5ZDNjMzYxYzMyOWZlOTRmYzgxMzhhZiIsInN1YiI6IjYzZWMyY2MzMWI3Mjk0MDBlNmYwYzc4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SlgrduGEzIUg7Loxz8uQw0WQw7bdE2nYyszesEbQa7Y';

  @override
  void initState(){
    loadMovies();
    super.initState();
  }

  // Funcion
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      )
    );
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    // print(trendingResults);
    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvResults['results'];

    });
    // print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const ModifiedText(
          text: "Movie App", 
          color: Colors.blueGrey, 
          size: 20,
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies,),
          TopRatedMovies(topRated: topRatedMovies,),
          PopularTvShows(popularTvShows: tv)
        ]
      ),
    );
  }
}