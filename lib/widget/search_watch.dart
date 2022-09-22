import 'package:flutter/material.dart';
import 'package:tentwenty/utills/modified_text.dart';

class SearchWatchWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SearchWatchWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            modified_text(text: 'Watch',color: Colors.black,size: 20,),
            IconButton(onPressed: onTap, icon:Icon(Icons.search,size: 30,) )
          ],
        ),
      ),
    );
  }
}
