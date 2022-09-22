import 'package:flutter/material.dart';
import 'package:tentwenty/screen/search_movies.dart';
import 'package:tentwenty/service/App_data.dart';
import 'package:tentwenty/widget/search_watch.dart';
import 'package:tentwenty/widget/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widget/bottom_navigation.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List upCommingMovies = [];

  loadMovies() async
  {
    TMDB tmdbWithCustomLog = TMDB(
        ApiKeys(AppData().apiKey,AppData().apiToken),
        logConfig:ConfigLogger(
          showLogs: true,
          showErrorLogs: true,

        ));



    Map upComingResult = await tmdbWithCustomLog.v3.movies.getUpcoming();

    setState(() {

      upCommingMovies = upComingResult['results'];
       print("printing results");
       print(upCommingMovies);
    });

    // print(upCommingMovies);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadMovies();
  }


  @override
  Widget build(BuildContext context) {

   // AppData().loadMovies();


    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: SearchWatchWidget(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchMovies()));
          },
        ) ,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                bodyContent,

                   UpComingMovies(upComingMovies: upCommingMovies,)

              ],
            ),
          ),

        ],
      ),
    );



  }

  Widget get bodyContent {
    return Container(color: Colors.white10);
  }

}
