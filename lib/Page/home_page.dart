import 'package:flutter/material.dart';
import 'package:movie/Utils/text.dart';
import 'package:movie/Widget/popular_tv_shows.dart';
import 'package:movie/Widget/top_rated_movielist.dart';
import 'package:movie/Widget/treanding_movie_list.dart';
import 'package:movie/Widget/upcomming_movie.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///Application a 3 ta serial hbe,there are treandingmovies,toprattedmovie and populartvshow


  ///treanding movies ar jnno

  List  treandingmovies =[];

  ///toprattedmovies ar jnnno
  List  toprattedmovies =[];

  ///tv ar jnno
  List  populartvshow =[];

  ///Upcoming ar jnno
  List upcommingmovies =[];

  final String apiKey= 'f3c54a9e2409ec2edfaf38bd18d05130';
  final readaccesstoken= 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2M1NGE5ZTI0MDllYzJlZGZhZjM4YmQxOGQwNTEzMCIsInN1YiI6IjY1YTBmYzMwMjE2MjFiMDEyZjU5NTQ2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByBajBXP2zYrOI-6tEZXIq0R31LrRbPaAJ2nX_3nugY';


  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  void loadmovies()async{
    TMDB tmdbWithCostomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
     /// for treandingresults
    ///
    Map treandingresults =await tmdbWithCostomLogs.v3.trending.getTrending();

    /// for topratttedmovies

    Map toprattedresults =await tmdbWithCostomLogs.v3.movies.getTopRated();

    /// for populartvshows

    Map populartvshowsresults =await tmdbWithCostomLogs.v3.tv.getPopular();

    ///for upcomming movies
    Map upcommingmovieresults =await tmdbWithCostomLogs.v3.movies.getUpcoming();

    print(treandingresults);

  setState(() {
    treandingmovies =treandingresults['results'];
    toprattedmovies =toprattedresults['results'];
    populartvshow =populartvshowsresults['results'];
    upcommingmovies =upcommingmovieresults['results'];
  });
  print(toprattedmovies);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: modified_Text(text: 'Flutter Movie Application', size: 15,),
      ),

      body: ListView(
        children: [
          Popular_TvShow(tvshow: populartvshow),
          UpcommingMovie(upcomming: upcommingmovies),
          TopRatedMovie(toprated: toprattedmovies),
          TreandinMovie(treanding: treandingmovies),
        ],
      ),
    );
  }
}
