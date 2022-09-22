import 'package:flutter/material.dart';
import 'package:tentwenty/utills/modified_text.dart';

import '../widget/bottom_navigation.dart';

class MovieDetail extends StatefulWidget {
  final String imageUrl;
  final String overView;
  const MovieDetail({Key? key, required this.imageUrl,required this.overView}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: getBody,
    );
  }

  Widget get getBody
  {
    return SingleChildScrollView(
      child: Stack(
       children: [
         Container(
           height: 1000,
         ),
         Positioned(
           top: 0,
      child:
      Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Image.network(widget.imageUrl,fit: BoxFit.fill,),

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 5,
              offset: Offset(7, 7), // changes position of shadow
            ),
          ],
        ),
      ),

         ),
         Positioned(
           top: 350,
           right: (MediaQuery.of(context).size.width)/3 - 30,
           child: SizedBox(
           height: 60.0,
           width: 200,
           child: MaterialButton(
             child: modified_text(text: 'Get Tickets',size: 15,),
             color: Colors.blue,
             disabledColor: Colors.blue,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(
                 Radius.circular(10.0), // Change your border radius here
               ),
             ),
             onPressed: () {},
           ),
         ),
         ),
         // SizedBox(height: 15,),
         Positioned(
           top: 420,
           right: (MediaQuery.of(context).size.width)/3 - 30,
           child: SizedBox(
             height: 60.0,
             width: 200,
             child: MaterialButton(

               child:Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Icon(Icons.play_arrow,color: Colors.white,),
                 SizedBox(width: 5,),
                 modified_text(text: 'Watch',size: 15,)
               ],),
               color: Colors.transparent,
               disabledColor: Colors.blue,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(
                   Radius.circular(10.0), // Change your border radius here
                 ),
               ),
               onPressed: () {},
             ),
           ),
         ),
        Positioned(
          bottom: 0,
          top: 520,
          // top: ,
          child:  Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  modified_text(text: 'Genre',color: Colors.black,size: 18,),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.green,
                    borderRadius: BorderRadius.circular(10
                    ),
                  ),

                          child: modified_text(text: 'Action',size: 15,),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(10
                          ),
                        ),

                        child: modified_text(text: 'Thriller',size: 15,),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10
                          ),
                        ),

                        child: modified_text(text: 'Science',size: 15,),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10
                          ),
                        ),

                        child: modified_text(text: 'Fiction',size: 15,),
                      ),
                    ],
                  ),


                  Divider(
                      color: Colors.black
                  ),
                  modified_text(text: "OverView",color: Colors.black,size: 18,),
                  Flexible(child: modified_text(text: widget.overView,color: Colors.black,))
                ],
              ),
            ),

        ),
        ),
       ],
      ),
    );
  }
}
