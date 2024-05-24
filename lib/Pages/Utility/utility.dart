



import 'package:flutter/material.dart';

class Utility{

  
  AppBar giveSuitableAppBar(int index,GlobalKey<ScaffoldState> key ){
    switch(index){
      case 0:
      return homePageAppBar(key);

      case 1:
      return matchPageAppBar(key);

      case 2:
      return followPageAppBar(key);

      case 3: 
      return StatsPageAppBar(key);
      default:
      return AppBar(title: Text("Test"),);  
    }
  }

  AppBar homePageAppBar(GlobalKey<ScaffoldState> key){
    return AppBar(
        title: const Text(
          "Football",
          style: TextStyle(
              color: Color.fromARGB(255, 55, 184, 59),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 204, 204),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      );
  }


  AppBar followPageAppBar(GlobalKey<ScaffoldState> key){
    return AppBar(
        title: Text(
          "Football",
          style: TextStyle(
              color: Color.fromARGB(255, 55, 184, 59),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 204, 204),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      );
  }

  AppBar matchPageAppBar(GlobalKey<ScaffoldState> key){
    return AppBar(
        title: Text(
          "Football",
          style: TextStyle(
              color: Color.fromARGB(255, 55, 184, 59),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 204, 204),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      );
  }

  AppBar StatsPageAppBar(GlobalKey<ScaffoldState> key){
    return AppBar(
        title: Text(
          "Football",
          style: TextStyle(
              color: Color.fromARGB(255, 55, 184, 59),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 206, 204, 204),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      );
  }

}