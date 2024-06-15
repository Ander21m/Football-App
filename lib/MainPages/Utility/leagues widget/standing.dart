import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballcustom/MainPages/Utility/utility.dart';



class StandingUtil {
  static Widget getAllMatches(Future<Map<String, dynamic>>? matchesData) {
    
    return FutureBuilder(
      future: matchesData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: ((MediaQuery.of(context).size.height - 350)) / 2),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical:
                          ((MediaQuery.of(context).size.height - 350)) / 2),
                  child: Center(child: Text('Error: ${snapshot.error}'))),
            ],
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical:
                          ((MediaQuery.of(context).size.height - 350) / 2)),
                  child: Center(child: Text('No matches found'))),
            ],
          );
        } else {
          List matches = snapshot.data!["matches"];

          return Column(
              children: matches.map(
            (m) {
              return Utility().getSingleMatch(m);
            },
          ).toList());
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

  static Widget getCupGroup(List groups,String leagueName) {
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text("Group Stage")),
          Container(
            height: 3,
            color: Colors.black,
          ),
          Column(
              children: groups.map(
            (e) {
              List table = e["table"];
              return Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(width: 170, child: Text(e["group"])),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("P"))),
                        SizedBox(
                          width: 3,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("W"))),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("D"))),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("L"))),
                        SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                            width: 40,
                            height: 20,
                            child: Center(child: Text("G/A"))),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("Dif"))),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 25,
                            height: 20,
                            child: Center(child: Text("Pts"))),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      child: Column(
                        children: table.map((team) {
                          Color color;
                          if (table[table.indexOf(team)]["position"] == 1 ||
                              table[table.indexOf(team)]["position"] == 2) {
                            color = Colors.green;
                          } else if (table[table.indexOf(team)]["position"] ==
                              3) {
                            color =  leagueName.endsWith("League")? const Color.fromARGB(255, 227, 178, 29):Colors.red;
                          } else if (table[table.indexOf(team)]["position"] ==
                              4) {
                            color = Colors.red;
                          } else {
                            color = Colors.white;
                          }
                          return Column(
                            children: [
                              Container(
                                color: color,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 15,
                                      child: Text(
                                          team["position"].toString() + "."),
                                    ),
                                    Container(
                                        width: 160,
                                        child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            team["team"]["shortName"])),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child: Text(team["playedGames"]
                                                .toString()))),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child:
                                                Text(team["won"].toString()))),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child:
                                                Text(team["draw"].toString()))),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child:
                                                Text(team["lost"].toString()))),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                                "${team["goalsFor"].toString()}/${team["goalsAgainst"].toString()}"))),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child: Text(team["goalDifference"]
                                                .toString()))),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 25,
                                        height: 20,
                                        child: Center(
                                            child: Text(
                                                team["points"].toString()))),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.black,
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 3,
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            },
          ).toList()),
          
        ],
      ),
    );
  }


  static Widget getGroupMatch(List matchesData,int matchNumbers,int playedGames){
    List matchNum = List.generate(matchNumbers,(i) => i);
    
    return Container(
      child: Column(children: matchNum.map((num){
        return Column(

          children: [
            Container(padding: EdgeInsets.symmetric(horizontal: 40),child: Text("Match ${num +1}")),
            Container(height: 3,color: Colors.black,),
            Column(children: matchesData.sublist(num *playedGames,(num + 1) * playedGames).map((match){
              return Utility().getSingleMatch(match);
            }).toList(),),
            Container(height: 3,color: Colors.black,),
          ],
        );
      }).toList()),
    );
  }
}
