import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class StandingUtil {
  static Widget getAllMatches(Future<Map<String, dynamic>>? matchesData) {
    return FutureBuilder(
      future: matchesData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              CircularProgressIndicator(
                color: Colors.green,
              ),
            ],
          ));
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Text('Error: ${snapshot.error}'),
            ],
          ));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Text('No standing for league found'),
            ],
          ));
        } else {
          List matches = snapshot.data!["matches"];
          
         
          return Column(children: matches.map((m) {
            
            DateFormat.MONTH_DAY;
            return Row(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                child: Column(
                  children: [
                   Text("${DateFormat.Md().format(DateTime.parse(m["utcDate"]).add(Duration(hours: 7)))}"),
                    Text("${DateFormat.Hm().format(DateTime.parse(m["utcDate"]).add(Duration(hours: 7)))}"),
                  ],
                ),
              ),
              SizedBox(
                        width: 32,
                        height: 32,
                        child: m["homeTeam"]["crest"].endsWith("png")
                            ? Image.network(m["homeTeam"]["crest"])
                            : SvgPicture.network(m["homeTeam"]["crest"]),
                      ),
              const SizedBox(width: 5,),
              SizedBox(width: 105,child: Text(m["homeTeam"]["shortName"])),
              
              Container(width: 20,child: Center(child: m["score"]["fullTime"]["home"] == null ? Text("??"):Text("${m["score"]["fullTime"]["home"]}"))),
              Text(" VS "),
              Container(width: 20,child: Center(child: m["score"]["fullTime"]["away"] == null ? Text("??"):Text("${m["score"]["fullTime"]["away"]}"))),
              Container(width: 105,child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Text(m["awayTeam"]["shortName"]),
                ],
              )),
              SizedBox(width: 5,),
              SizedBox(
                        width: 32,
                        height: 32,
                        child: m["awayTeam"]["crest"].endsWith("png")
                            ? Image.network(m["awayTeam"]["crest"])
                            : SvgPicture.network(m["awayTeam"]["crest"]),
                      ),
            ],);
          },).toList());
        }
      },
    );
  }

  static Widget getStanding(List<dynamic> teams) {
    return Container(
      color: Color.fromARGB(255, 104, 175, 106),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              SizedBox(
                  width: 180,
                  height: 20,
                  child: Center(
                    child: Text(
                      "Team",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              SizedBox(width: 25, height: 20, child: Text("P")),
              SizedBox(
                width: 3,
              ),
              SizedBox(width: 25, height: 20, child: Text("W")),
              SizedBox(
                width: 5,
              ),
              SizedBox(width: 25, height: 20, child: Text("D")),
              SizedBox(
                width: 5,
              ),
              SizedBox(width: 25, height: 20, child: Text("L")),
              SizedBox(
                width: 5,
              ),
              SizedBox(width: 40, height: 20, child: Text("G/A")),
              SizedBox(
                width: 5,
              ),
              SizedBox(width: 25, height: 20, child: Text("Dif")),
              SizedBox(
                width: 5,
              ),
              SizedBox(width: 25, height: 20, child: Text("Pts")),
            ],
          ),
          Container(
            height: 3,
            color: Colors.black,
          ),
          Column(
            children: teams.map((team) {
              String badge = team["team"]["crest"];
              String name = team["team"]["shortName"];

              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(
                            child: Text(
                              "${team["position"]}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: badge.endsWith("png")
                            ? Image.network(badge)
                            : SvgPicture.network(badge),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 110,
                        child: Text(name),
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(
                              child: Text(team["playedGames"].toString()))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(child: Text(team["won"].toString()))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(child: Text(team["draw"].toString()))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(child: Text(team["lost"].toString()))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 48,
                          height: 48,
                          child: Center(
                              child: Text(
                                  "${team["goalsFor"]}/${team["goalsAgainst"]}"))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Center(
                              child: Text(team["goalDifference"].toString()))),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child:
                              Center(child: Text(team["points"].toString()))),
                    ],
                  ),
                  Container(
                    height: 3,
                    color: Colors.black,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
