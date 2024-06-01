import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:footballcustom/Pages/Utility/leagues%20widget/standing.dart';
import 'package:footballcustom/Pages/Utility/utility.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class statsPage extends StatefulWidget {
  const statsPage({super.key});

  @override
  State<statsPage> createState() => _statsPageState();
}

class _statsPageState extends State<statsPage> {
  Future<Map<String, dynamic>>? standingData;
  Future<Map<String, dynamic>>? allMatchesForLeague;

  int _matchIndex = 1;
  int _headerindex = 0;
  final List<int> numbers = List<int>.generate(38, (i) => i + 1);
  int _currentLeagueIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              itemCount: 6,
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
                      SizedBox(
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
                  List<dynamic> teams = snapshot.data!["standings"][0]["table"];
                  return Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                }
              }),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getLeagueStanding(String apiurl) async {
    final response = await http.get(
      Uri.parse(apiurl),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
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
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body)["matches"][0]["score"]);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load live scores');
    }
  }

  Widget buildStandingPageBody(i, m) {
    switch (i) {
      case 0:
        _matchIndex = 1;
        return StandingUtil.getStanding(m);

      case 1:
      
      allMatchesForLeague = getAllMatchesForLeague(
                            "${Utility().getLeagueStandingapiList()[_currentLeagueIndex]["matches"]!}?matchday=$_matchIndex");
        return Column(
          children: [
            
            Container(
              color: const Color.fromARGB(255, 86, 193, 195),
              child: Row(
                children: [
                  SizedBox(width: 60,),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    items: numbers.map((int number) {
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
                        
                        print(_matchIndex);
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
            SizedBox(height: 5,),
            StandingUtil.getAllMatches(allMatchesForLeague)
          ],
        );

      default:
      _matchIndex = 1;
        return Text("hello");
    }
  }
}
