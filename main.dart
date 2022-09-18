
import 'package:flutter/material.dart';
import 'package:moviesapp/page.dart';
import 'package:moviesapp/Splash.dart';
import 'package:moviesapp/utilies/text.dart';
import 'package:moviesapp/widget/nowplaying.dart';
import 'package:moviesapp/widget/toprated.dart';
import 'package:moviesapp/widget/trending.dart';
import 'package:moviesapp/widget/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widget/tv.dart';

void main() => runApp(const MyApp(

));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Page2(),
        '/b': (context) => Splash(),

      },
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '66dd783866d6b3d889eec8b6f0ca0378';
  final String readaccesstoken = 'ueyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmRkNzgzODY2ZDZiM2Q4ODllZWM4YjZmMGNhMDM3OCIsInN1YiI6IjYyZjljYjY4N2ViNWYyMDA3YmNjZjhlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tMaTgl4X7aeP3t4WCfT59uz9oT71JBD54L6FdKdC15Y';
  List nowplayingmovies = [];
  List trendingmovies = [];
  List topratedmovies = [];
  List popularmovies = [];
  List upcomingmovies=[];



  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularmovieresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map upcomingmovieresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      nowplayingmovies= nowplayingresult['results'];
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      popularmovies = popularmovieresult['results'];
      upcomingmovies = upcomingmovieresult['results'];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent,

        leading: Container(
          // margin:
          // const EdgeInsets.only(left: 30),
          padding: const EdgeInsets.only(left: 10),

          child: const CircleAvatar(
            backgroundImage: AssetImage('images/chinema.png'),radius: 46,
          ),

        ),
        title: const modified_text(
          text: 'Crazy Movies',
          size: 22, color: Colors.orangeAccent,
        ),

      ),

      body: ListView(
        children: [
          Nowplaying(nowplaying: nowplayingmovies),
          PopularMovies(popular: popularmovies),
          TrendingMovies(trending:trendingmovies),
          TopRatedMovies( toprated: topratedmovies),
          UpcomingMovies(upcoming: upcomingmovies),
        ],
      ),
    );
  }
}
