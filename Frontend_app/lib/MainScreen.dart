import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vastra/CategoryPage.dart';
import 'package:vastra/HomePage.dart';
import 'package:vastra/ProfilePage.dart';
import 'package:vastra/theme.dart';

class MainScreen extends StatefulWidget{

  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>{

  int currentindex=0;

List<Widget>pages = [

  Homepage(),
  Categorypage(),
  Profilepage(),


];

@override
  Widget build(BuildContext context) {

  return Scaffold(
    body: pages[currentindex],

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentindex,
        selectedItemColor:Colors.lime,
        onTap: (index){
        setState(() {
          currentindex=index;

        });

        },
        type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home"

        ),

        BottomNavigationBarItem(icon: Icon(Icons.category),
        label: "Categories"
        ),

        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Profile"
        )



      ],



    ),

  );



  }

}