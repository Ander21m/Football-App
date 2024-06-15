import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:intl/intl.dart';

import 'Utility/Info/api.dart';
import 'Utility/leagues widget/standing.dart';
import 'Utility/utility.dart';

class statsPage extends StatefulWidget {
  const statsPage({super.key});

  @override
  State<statsPage> createState() => _statsPageState();
}

class _statsPageState extends State<statsPage> {
  Future<Map<String, dynamic>>? standingData;
  Future<Map<String, dynamic>>? allMatchesForLeague;
  DateFormat dateformat = DateFormat("dd/MM");
  int _matchIndex = 1;
  int _headerindex = 0;
  String? _currentyear;
  final List<String> yearNumbers = [];
  List<int> matchNumbers = [];
  int _currentLeagueIndex = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 2020; i < DateTime.now().year; i++) {
      yearNumbers.add(
          "${i.toString().substring(2)}/${(i + 1).toString().substring(2)}");
    }
    _currentyear = yearNumbers[yearNumbers.length - 1];

    standingData = getLeagueStanding(
        Utility().getLeagueStandingapiList()[_currentLeagueIndex]["standing"]!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentLeagueIndex = index;
                      _headerindex = 0;
                      standingData = getLeagueStanding(Utility()
                              .getLeagueStandingapiList()[_currentLeagueIndex]
                          ["standing"]!);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.all(5),
                    color:
                        _currentLeagueIndex == index ? Colors.red : Colors.blue,
                    child: Center(
                      child: Text(
                        Utility().getLeagueList()[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              itemCount: Utility().getLeagueList().length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            height: 3,
            color: Colors.black,
          ),
          FutureBuilder<Map<String, dynamic>>(
              future: standingData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ((MediaQuery.of(context).size.height - 220)) /
                                    2),
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
                                  ((MediaQuery.of(context).size.height - 220)) /
                                      2),
                          child:
                              Center(child: Text('Error: ${snapshot.error}'))),
                    ],
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  ((MediaQuery.of(context).size.height - 220) /
                                      2)),
                          child: const Center(
                              child: Text('No standing for league found'))),
                    ],
                  );
                } else {
                  if (snapshot.data!["competition"]["type"] == "LEAGUE") {
                    List<dynamic> teams =
                        snapshot.data!["standings"][0]["table"];
                    matchNumbers =
                        List.generate((teams.length - 1) * 2, (i) => i + 1);
                    return Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    (MediaQuery.of(context).size.width / 2) -
                                        70,
                                    0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      width: 82,
                                      color: Colors.white,
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: _currentyear,
                                          items: yearNumbers.map((e) {
                                            return DropdownMenuItem<String>(
                                                value: e, child: Text(e));
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              _currentyear = value;
                                              standingData = getLeagueStanding(
                                                  "${Utility().getLeagueStandingapiList()[_currentLeagueIndex]["standing"]!}/?season=20${value!.substring(0, 2)}");
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 3,
                                color: Colors.black,
                              ),
                              Row(
                                  children:
                                      Utility().getLeadgueHeaderList().map(
                                (e) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _headerindex = Utility()
                                                  .getLeadgueHeaderList()
                                                  .indexOf(e);
                                            });
                                          },
                                          child: Container(
                                              height: 30,
                                              color: _headerindex ==
                                                      Utility()
                                                          .getLeadgueHeaderList()
                                                          .indexOf(e)
                                                  ? Colors.white
                                                  : Colors.orange,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Center(child: Text(e)))),
                                      Container(
                                        width: 3,
                                        color: Colors.black,
                                      )
                                    ],
                                  );
                                },
                              ).toList()),
                            ],
                          ),
                        ),
                        Container(
                          height: 3,
                          color: Colors.black,
                        ),
                        buildStandingPageBody(_headerindex, teams)
                      ],
                    );
                  } else {
                    List<dynamic> groups = snapshot.data!["standings"];
                    return Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    (MediaQuery.of(context).size.width / 2) -
                                        70,
                                    0),
                              ),
                              Container(
                                width: 3,
                                color: Colors.black,
                              ),
                              Row(
                                  children: Utility().getCupGroupList().map(
                                (e) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _headerindex = Utility()
                                                  .getCupGroupList()
                                                  .indexOf(e);
                                            });
                                          },
                                          child: Container(
                                              height: 30,
                                              color: _headerindex ==
                                                      Utility()
                                                          .getCupGroupList()
                                                          .indexOf(e)
                                                  ? Colors.white
                                                  : Colors.orange,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Center(child: Text(e)))),
                                      Container(
                                        width: 3,
                                        color: Colors.black,
                                      )
                                    ],
                                  );
                                },
                              ).toList()),
                            ],
                          ),
                        ),
                        Container(
                          height: 3,
                          color: Colors.black,
                        ),
                        getCupFormat(groups, _headerindex,
                            Utility().getLeagueList()[_currentLeagueIndex])
                      ],
                    );
                  }
                }
              }),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getLeagueStanding(String apiurl) async {
    final response = await http.get(
      Uri.parse(apiurl),
      headers: {'X-Auth-Token': getApiHere()},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load live scores');
    }
  }

  Future<Map<String, dynamic>> getAllMatchesForLeague(String apiurl) async {
    final response = await http.get(
      Uri.parse(apiurl),
      headers: {'X-Auth-Token': getApiHere()},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load live scores');
    }
  }

  Widget buildStandingPageBody(int i, List teams) {
    switch (i) {
      case 0:
        _matchIndex = 1;
        return StandingUtil.getStanding(teams);

      case 1:
        allMatchesForLeague = getAllMatchesForLeague(
            "${Utility().getLeagueStandingapiList()[_currentLeagueIndex]["matches"]!}/?matchday=$_matchIndex&season=20${_currentyear!.substring(0, 2)}");

        return Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 86, 193, 195),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 48,
                    width: 3,
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      "Fixture",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 48,
                    width: 3,
                    color: Colors.white,
                  ),
                  DropdownButton<int>(
                    value: _matchIndex,
                    items: matchNumbers.map((int number) {
                      return DropdownMenuItem<int>(
                        value: number,
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _matchIndex = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 48,
                    width: 3,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            StandingUtil.getAllMatches(allMatchesForLeague)
          ],
        );

      default:
        _matchIndex = 1;
        return Text("hello");
    }
  }

  Widget getCupFormat(List groups, int i, String leagueName) {
    switch (i) {
      case 0:
        return StandingUtil.getCupGroup(groups, leagueName);
      case 1:
        allMatchesForLeague = getAllMatchesForLeague(
            "${Utility().getLeagueStandingapiList()[_currentLeagueIndex]["matches"]!}");

        return FutureBuilder(
            future: allMatchesForLeague,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical:
                              ((MediaQuery.of(context).size.height - 350)) / 2),
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
                                ((MediaQuery.of(context).size.height - 350)) /
                                    2),
                        child: Center(child: Text('Error: ${snapshot.error}'))),
                  ],
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ((MediaQuery.of(context).size.height - 350) /
                                    2)),
                        child: Center(child: Text('No matches found'))),
                  ],
                );
              } else {
                if (snapshot.data!["matches"].length > 100) {
                  List sixteenTeamMatch =
                      snapshot.data!["matches"].sublist(96, 112);
                  List quarterMatch =
                      snapshot.data!["matches"].sublist(112, 120);
                  List semiMatch = snapshot.data!["matches"].sublist(120, 124);
                  List finalMatch = snapshot.data!["matches"].sublist(124);

                  return Container(
                    child: Column(
                      children: [
                        Utility().getSingleKORoundMatch(
                            sixteenTeamMatch.sublist(
                                0, (sixteenTeamMatch.length / 2).toInt()),
                            "Round Of 16(1st Round)",
                            true),
                        Utility().getDoubleKORoundMatch(
                          sixteenTeamMatch
                              .sublist((sixteenTeamMatch.length / 2).toInt()),
                          "Round Of 16(2nd Round)",
                          sixteenTeamMatch.sublist(
                              0, (sixteenTeamMatch.length / 2).toInt()),
                        ),
                        Utility().getSingleKORoundMatch(
                            quarterMatch.sublist(
                                0, (quarterMatch.length / 2).toInt()),
                            "Quarter Final(1st Round)",
                            true),
                        Utility().getDoubleKORoundMatch(
                          quarterMatch
                              .sublist((quarterMatch.length / 2).toInt()),
                          "Quarter Final(2nd Round)",
                          quarterMatch.sublist(
                              0, (quarterMatch.length / 2).toInt()),
                        ),
                        Utility().getSingleKORoundMatch(
                            semiMatch.sublist(
                                0, (semiMatch.length / 2).toInt()),
                            "Semi Final(1st Round)",
                            true),
                        Utility().getDoubleKORoundMatch(
                          semiMatch.sublist((semiMatch.length / 2).toInt()),
                          "Semi Final(2nd Round)",
                          semiMatch.sublist(0, (semiMatch.length / 2).toInt()),
                        ),
                        Utility()
                            .getSingleKORoundMatch(finalMatch, "Final", false),
                      ],
                    ),
                  );
                } else {
                  if (snapshot.data!["matches"][0]["area"]["name"] == "World") {
                    
                      List sixteenTeamMatch =
                          snapshot.data!["matches"].sublist(48, 56);
                      List quarterMatch =
                          snapshot.data!["matches"].sublist(56, 60);
                      List semiMatch =
                          snapshot.data!["matches"].sublist(60, 62);
                      List finalMatch = snapshot.data!["matches"].sublist(63);
                      bool isOver100AndNotFinal = false;
                      return Container(
                        child: Column(
                          children: [
                            Utility().getSingleKORoundMatch(sixteenTeamMatch,
                                "Round Of 16", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(quarterMatch,
                                "Quarter Final", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(
                                semiMatch, "Semi Final", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(
                                finalMatch, "Final", isOver100AndNotFinal),
                          ],
                        ),
                      );
                   
                  } else {
                    
                   
                      List sixteenTeamMatch =
                          snapshot.data!["matches"].sublist(36, 44);
                      List quarterMatch =
                          snapshot.data!["matches"].sublist(44, 48);
                      List semiMatch =
                          snapshot.data!["matches"].sublist(48, 50);
                      List finalMatch = snapshot.data!["matches"].sublist(50);
                      bool isOver100AndNotFinal = false;
                      return Container(
                        child: Column(
                          children: [
                            Utility().getSingleKORoundMatch(sixteenTeamMatch,
                                "Round Of 16", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(quarterMatch,
                                "Quarter Final", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(
                                semiMatch, "Semi Final", isOver100AndNotFinal),
                            Utility().getSingleKORoundMatch(
                                finalMatch, "Final", isOver100AndNotFinal),
                          ],
                        ),
                      );
                    
                  }
                }
              }
            });
      case 2:
        allMatchesForLeague = getAllMatchesForLeague(
            "${Utility().getLeagueStandingapiList()[_currentLeagueIndex]["matches"]!}");

        return FutureBuilder(
            future: allMatchesForLeague,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical:
                              ((MediaQuery.of(context).size.height - 350)) / 2),
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
                                ((MediaQuery.of(context).size.height - 350)) /
                                    2),
                        child: Center(child: Text('Error: ${snapshot.error}'))),
                  ],
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ((MediaQuery.of(context).size.height - 350) /
                                    2)),
                        child: Center(child: Text('No matches found'))),
                  ],
                );
              } else {
                if (snapshot.data!["matches"].length > 100) {
                  return StandingUtil.getGroupMatch(
                      snapshot.data!["matches"], 6, 16);
                } else {
                  if (snapshot.data!["matches"][0]["area"]["name"] == "World") {
                    return StandingUtil.getGroupMatch(
                        snapshot.data!["matches"], 3, 16);
                  } else {
                    return StandingUtil.getGroupMatch(
                        snapshot.data!["matches"], 3, 12);
                  }
                }
              }
            });
      default:
        return Text("Nothing to match");
    }
  }
}
