import 'package:flutter/material.dart';
import 'package:tentwenty/screen/movie_detail_screen.dart';
import 'package:tentwenty/service/App_data.dart';
import 'package:tentwenty/utills/modified_text.dart';

class UpComingMovies extends StatelessWidget {
  final List upComingMovies ;
  const UpComingMovies({Key? key, required this.upComingMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return upComingMovies.length != 0 ? ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 3,
        itemBuilder: (context , index)
    {
      return InkWell(
        onTap: (){
          // print(upComingMovies[index]['id']);
          String url = 'https://image.tmdb.org/t/p/w500/'+upComingMovies[index]['poster_path'];
          String overView = upComingMovies[index]['overview'];

          Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetail(imageUrl: url, overView: overView,)));
        },
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        ),
         padding: EdgeInsets.all(12),
          height: 220,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
    
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(

                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/'+upComingMovies[index]['backdrop_path']

                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

               Padding(padding: EdgeInsets.only(left: 12,bottom: 5),
               child:
               modified_text(text:
               upComingMovies[index]['title'] != null? upComingMovies[index]['title'] : 'Loading' ,

                 size: 20,color: Colors.white,)
                 ,
               )
              ],
            ),
          ),
        ),
      );
    }
    ) : Center(child: CircularProgressIndicator());
  }


}
