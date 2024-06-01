import 'package:flutter/material.dart';

class Utility {
  List<String> leagues = [
    "EPL",
    "La Liga",
    "Serie A",
    "Bundesliga",
    "Ligue 1",
    "Eredivisie"
  ];

  List<String> tableHeader = ["standing", "matches", "player"];
  List<Map<String, String>> apiurl = [
    {
      "standing": "http://api.football-data.org/v4/competitions/PL/standings",
      "matches": "http://api.football-data.org/v4/competitions/PL/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/PD/standings",
      "matches": "http://api.football-data.org/v4/competitions/PD/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/SA/standings",
      "matches": "http://api.football-data.org/v4/competitions/SA/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/BL1/standings",
      "matches": "http://api.football-data.org/v4/competitions/BL1/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/FL1/standings",
      "matches": "http://api.football-data.org/v4/competitions/FL1/matches"
    },

    {
      "standing": "http://api.football-data.org/v4/competitions/DED/standings",
      "matches": "http://api.football-data.org/v4/competitions/DED/matches"
    },
    
    
  ];

  AppBar giveSuitableAppBar(int index, GlobalKey<ScaffoldState> key) {
    switch (index) {
      case 0:
        return homePageAppBar(key);

      case 1:
        return matchPageAppBar(key);

      case 2:
        return followPageAppBar(key);

      case 3:
        return StatsPageAppBar(key);
      default:
        return AppBar(
          title: Text("Test"),
        );
    }
  }

  AppBar homePageAppBar(GlobalKey<ScaffoldState> key) {
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

  AppBar followPageAppBar(GlobalKey<ScaffoldState> key) {
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

  AppBar matchPageAppBar(GlobalKey<ScaffoldState> key) {
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

  AppBar StatsPageAppBar(GlobalKey<ScaffoldState> key) {
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

  List<String> getLeagueList() {
    return leagues;
  }

  List<Map<String,String>> getLeagueStandingapiList() {
    return apiurl;
  }

  List<String> getLeadgueHeaderList() {
    return tableHeader;
  }
}
