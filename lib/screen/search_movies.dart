import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty/service/App_data.dart';
import 'package:tentwenty/utills/modified_text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widget/bottom_navigation.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({Key? key}) : super(key: key);

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}



class _SearchMoviesState extends State<SearchMovies> {



  List genreList = [];
  List searchMoviesList = [];
  TextEditingController searchTextEditingController = TextEditingController();

  String status = "genre";
   String query = 'a';
  loadData() async
  {
    TMDB tmdbWithCustomLog = TMDB(
        ApiKeys(AppData().apiKey,AppData().apiToken),
        logConfig:ConfigLogger(
          showLogs: true,
          showErrorLogs: true,

        ));

    Map genresMap = await tmdbWithCustomLog.v3.genres.getMovieList();
    Map searchMoviesMap = await tmdbWithCustomLog.v3.search.queryMovies(query);
    setState(() {
      genreList = genresMap['genres'];
      searchMoviesList = searchMoviesMap['results'];
    });

    print(query);
    print(searchMoviesList);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        flexibleSpace: getTextField()
      ),
      bottomNavigationBar: BottomNavigation(),
      body: getBody(),
    );
  }

  Widget getBody()
  {
    print(status);
    if(status == 'genre')
      {
        return genreList != 0 ? GridView.builder(
            itemCount: genreList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ),
            itemBuilder: (context,index)
            {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 10,
                          blurRadius: 1,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],

                    ),
                    child: Center(
                      child: Text(genreList[index]['name'],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),

                      ),
                    ),
                  ),
                ],
              );
            }) : Center(
          child: CircularProgressIndicator(),
        );
      }

    else
      {
       return searchResult();
        // return SearchResultScreen(SearchQuerry: searchTextEditingController.text,);
      }

  }

  Widget searchResult()
  {
    return (searchMoviesList.length != 0 ) ? Container(
      // height: 150,
      child: ListView.builder(
          itemCount: searchMoviesList.length,
          itemBuilder: (context,index)
          {
            return Column(
              children: [
                Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(

                                    'https://image.tmdb.org/t/p/w500/'+searchMoviesList[index]['backdrop_path']

                                )

                            )
                        ),

                      ),
                      Expanded(
                        child: Column(
                          children: [
                            modified_text(text: searchMoviesList[index]['title'],color: Colors.black,size: 15,
                              textOverflow: TextOverflow.ellipsis,


                            ),
                            modified_text(text: 'genre',color: Colors.grey,),
                          ],
                        ),
                      ),
                      Icon(Icons.linear_scale,color: Colors.blue,)
                    ],
                  ),
                ),
              ],
            );
          }


      ),
    ) : Center(child: CircularProgressIndicator(),);
  }
  Widget getTextField()
  {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: TextField(
            controller: searchTextEditingController,
            onTap: (){
              setState(() {
                status = "search";
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResultScreen()));
            },
            onChanged: (value)
            {
              setState(() {
                query = value;
                loadData();
              });
              // searchMovies(value);
            },
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 15,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: Icon(Icons.search,color: Colors.black,),
                hintText: 'TV shows, movies and more',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 32.0),
                    borderRadius: BorderRadius.circular(25.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 32.0),
                    borderRadius: BorderRadius.circular(25.0)))),
      ),
    );
  }
}
