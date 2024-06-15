import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Utility {
  List<String> leagues = [
    "EPL",
    "La Liga",
    "Serie A",
    "Bundesliga",
    "Ligue 1",
    "Eredivisie",
    "Primeira Liga",
    "Championship",
    "Champions League",
    "World Cup",
    "European Championship"
  ];
  late Map<String, dynamic> sameMatch;
  DateFormat dateformat = DateFormat("dd/MM");
  List<String> leagueTableHeader = ["standing", "matches"];
  List<String> cupTableHeader = ["Group", "K.O", "Group Matches"];
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
    {
      "standing": "http://api.football-data.org/v4/competitions/PPL/standings",
      "matches": "http://api.football-data.org/v4/competitions/PPL/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/ELC/standings",
      "matches": "http://api.football-data.org/v4/competitions/ELC/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/CL/standings",
      "matches": "http://api.football-data.org/v4/competitions/CL/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/WC/standings",
      "matches": "http://api.football-data.org/v4/competitions/WC/matches"
    },
    {
      "standing": "http://api.football-data.org/v4/competitions/EC/standings",
      "matches": "http://api.football-data.org/v4/competitions/EC/matches"
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

  String GetDayName(int weekdayNumber) {
    switch (weekdayNumber) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      default:
        return "Sun";
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

  Widget getSingleKORoundMatch(
      List match, String header, bool isOver100AndNotFinal) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(header),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
        Column(
          children: match.map((m) {
            if (m["homeTeam"]["name"] != null &&
                m["awayTeam"]["name"] != null) {
              return isOver100AndNotFinal
                  ? Column(
                      children: [
                        Utility().getSingleMatch(m),
                        Container(
                          height: 1,
                          color: Colors.black,
                        )
                      ],
                    )
                  : checkRegularOrExtraTimeForSingleKOMatch(m);
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Center(
                      child: Text(
                    "No Information yet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              );
            }
          }).toList(),
        ),
        Container(
          height: 3,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget getDoubleKORoundMatch(List match, String header, List firstMatch) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(header),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
        Column(
          children: match.map((m) {
            if (m["homeTeam"]["name"] != null &&
                m["awayTeam"]["name"] != null) {
              return checkRegularOrExtraTimeForDoubleKOMatch(m, firstMatch);
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Center(
                      child: Text(
                    "No Information yet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              );
            }
          }).toList(),
        ),
        Container(
          height: 3,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget getSingleMatch(Map<String, dynamic> match) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
            children: [
              Text(
                  "${dateformat.format(DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))}"),
              Text(
                  "${DateFormat.Hm().format(DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))}"),
            ],
          ),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: match["homeTeam"]["crest"]?.endsWith("png")
              ? Image.network(match["homeTeam"]["crest"])
              : SvgPicture.network(match["homeTeam"]["crest"]),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(width: 105, child: Text(match["homeTeam"]["shortName"])),
        Container(
            width: 20,
            child: Center(
                child: Text("${match["score"]["fullTime"]["home"] ?? "??"}"))),
        Text(" VS "),
        Container(
            width: 20,
            child: Center(
                child: Text("${match["score"]["fullTime"]["away"] ?? "??"}"))),
        Container(
            width: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(match["awayTeam"]["shortName"]),
              ],
            )),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: match["awayTeam"]["crest"].endsWith("png")
              ? Image.network(match["awayTeam"]["crest"])
              : SvgPicture.network(match["awayTeam"]["crest"]),
        ),
      ],
    );
  }

  Widget getExtraTimeMatch(Map<String, dynamic> match) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
            children: [
              Text(
                  "${dateformat.format(DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))}"),
              Text(
                  "${DateFormat.Hm().format(DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))}"),
            ],
          ),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: match["homeTeam"]["crest"].endsWith("png")
              ? Image.network(match["homeTeam"]["crest"])
              : SvgPicture.network(match["homeTeam"]["crest"]),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(width: 105, child: Text(match["homeTeam"]["shortName"])),
        Container(
            width: 20,
            child: Center(
                child:
                    Text("${match["score"]["regularTime"]["home"] ?? "??"}"))),
        Text(" VS "),
        Container(
            width: 20,
            child: Center(
                child:
                    Text("${match["score"]["regularTime"]["away"] ?? "??"}"))),
        Container(
            width: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(match["awayTeam"]["shortName"]),
              ],
            )),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: match["awayTeam"]["crest"].endsWith("png")
              ? Image.network(match["awayTeam"]["crest"])
              : SvgPicture.network(match["awayTeam"]["crest"]),
        ),
      ],
    );
  }

  List<String> getLeagueList() {
    return leagues;
  }

  List<Map<String, String>> getLeagueStandingapiList() {
    return apiurl;
  }

  List<String> getCupGroupList() {
    return cupTableHeader;
  }

  List<String> getLeadgueHeaderList() {
    return leagueTableHeader;
  }

  Widget checkRegularOrExtraTimeForSingleKOMatch(Map<String, dynamic> match) {
    switch (match["score"]["duration"]) {
      case "PENALTY_SHOOTOUT":
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Container(
                  child: Text(
                    "(EXT ${match["score"]["extraTime"]["home"]} VS ${match["score"]["extraTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "(PEN ${match["score"]["penalties"]["home"]} VS ${match["score"]["penalties"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Utility().getExtraTimeMatch(match),
            Container(
              height: 1,
              color: Colors.black,
            )
          ],
        );

      case "REGULAR":
        return Column(children: [
          Utility().getSingleMatch(match),
          Container(
            height: 1,
            color: Colors.black,
          )
        ]);
      default:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  child: Text(
                    "(EXT ${match["score"]["extraTime"]["home"]} VS ${match["score"]["extraTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Utility().getExtraTimeMatch(match),
            Container(
              height: 1,
              color: Colors.black,
            )
          ],
        );
    }
  }

  Widget checkRegularOrExtraTimeForDoubleKOMatch(
      Map<String, dynamic> match, List firstMatch) {
    switch (match["score"]["duration"]) {
      case "PENALTY_SHOOTOUT":
        for (int i = 0; i < firstMatch.length; i++) {
          if (match["homeTeam"]["shortName"] ==
              firstMatch[i]["awayTeam"]["shortName"]) {
            sameMatch = firstMatch[i];
          }
        }
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 85,
                ),
                Container(
                  child: Text(
                    "(EXT ${match["score"]["extraTime"]["home"]} VS ${match["score"]["extraTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "(PEN ${match["score"]["penalties"]["home"]} VS ${match["score"]["penalties"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "(AGG ${match["score"]["fullTime"]["home"]} VS ${match["score"]["fullTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Utility().getExtraTimeMatch(match),
            Container(
              height: 1,
              color: Colors.black,
            )
          ],
        );

      case "REGULAR":
        for (int i = 0; i < firstMatch.length; i++) {
          if (match["homeTeam"]["shortName"] ==
              firstMatch[i]["awayTeam"]["shortName"]) {
            sameMatch = firstMatch[i];
          }
        }
        return Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                child: Text(
                  "(AGG ${sameMatch["score"]["fullTime"]["away"] + match["score"]["fullTime"]["home"]}  VS  ${sameMatch["score"]["fullTime"]["home"] + match["score"]["fullTime"]["away"]})",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Utility().getSingleMatch(match),
          Container(
            height: 1,
            color: Colors.black,
          )
        ]);
      default:
        for (int i = 0; i < firstMatch.length; i++) {
          if (match["homeTeam"]["shortName"] ==
              firstMatch[i]["awayTeam"]["shortName"]) {
            sameMatch = firstMatch[i];
          }
        }
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Container(
                  child: Text(
                    "(EXT ${match["score"]["extraTime"]["home"]} VS ${match["score"]["extraTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "(AGG ${match["score"]["fullTime"]["home"]} VS ${match["score"]["fullTime"]["away"]})",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Utility().getExtraTimeMatch(match),
            Container(
              height: 1,
              color: Colors.black,
            )
          ],
        );
    }
  }

  Widget buildTeamCrest(Map<String, dynamic> team) {
    if (team["name"] == null) {
      return Icon(Icons.question_mark);
    }

    final crestUrl = team["crest"];
    if (crestUrl == null) {
      return Icon(Icons.question_mark);
    }

    return crestUrl.endsWith("png")
        ? Image.network(crestUrl)
        : SvgPicture.network(crestUrl);
  }
}
