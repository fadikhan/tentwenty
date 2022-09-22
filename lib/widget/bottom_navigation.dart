import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 1;


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),

        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value){

            setState((){ this._currentIndex = value; });

          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_outlined,size: 25,),
                label: 'Dashboard',

            ),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection,size: 25,), label: 'Watch'),
            BottomNavigationBarItem(icon: Icon(Icons.perm_media_rounded,size: 25,), label: 'Media library'),
            BottomNavigationBarItem(icon: Icon(Icons.read_more,size: 25,), label: 'More'),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
            backgroundColor:Colors.black54,
          type: BottomNavigationBarType.fixed,

        ),
      ),
    );
  }
}

