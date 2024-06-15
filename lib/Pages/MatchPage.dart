import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:footballcustom/Pages/Utility/Info/api.dart';
import 'package:footballcustom/Pages/Utility/utility.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class matchPage extends StatefulWidget {
  const matchPage({super.key});

  @override
  State<matchPage> createState() => _matchPageState();
}

class _matchPageState extends State<matchPage> {
  Future<List<dynamic>>? matches;
  final DateTime _currentDay = DateTime.now();
  List<Map<String, List<dynamic>>> matchData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matches = testValue();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: FutureBuilder<List<dynamic>>(
        future: matches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical:
                          ((MediaQuery.of(context).size.height - 160)) / 2),
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
                            ((MediaQuery.of(context).size.height - 160)) / 2),
                    child: Center(child: Text('Error: ${snapshot.error}'))),
              ],
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical:
                            ((MediaQuery.of(context).size.height - 160) / 2)),
                    child: Center(child: Text('No matches found'))),
              ],
            );
          } else {
            for (var match in snapshot.data!) {
              if (matchData.length == 0) {
                matchData.add({
                  (DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))
                      .toString()
                      .substring(0, 10): [match]
                });
              } else {
                if (matchData[matchData.length - 1].containsKey(
                    (DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))
                        .toString()
                        .substring(0, 10))) {
                  matchData[matchData.length - 1][
                          (DateTime.parse(match["utcDate"])
                                  .add(Duration(hours: 7)))
                              .toString()
                              .substring(0, 10)]!
                      .add(match);
                } else {
                  matchData.add({
                    (DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))
                        .toString()
                        .substring(0, 10)
                        .substring(0, 10): [match]
                  });
                }
              }
            }

            return Column(
              children: matchData.map((match) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 3,
                      ),
                      Text(
                        "${match.keys.toList()[0]} / ${Utility().GetDayName(DateTime.parse(match.keys.toList()[0]).weekday)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        color: Colors.black,
                        height: 3,
                      ),
                      Column(
                        children:
                            match[match.keys.toList()[0].toString()]!.map((m) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 20,
                                  child: Text(
                                    m["competition"]["name"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  )),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),

                                  SizedBox(
                                    width: 38,
                                    height: 38,
                                    child: Utility().buildTeamCrest(m["homeTeam"])
                                  ),

                                  // child: m["homeTeam"]["crest"]
                                  //         .endsWith("png")
                                  //     ? Image.network(
                                  //         m["homeTeam"]["crest"])
                                  //     : SvgPicture.network(
                                  //         m["homeTeam"]["crest"])),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      width: 117,
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                        m["homeTeam"]["shortName"] ?? "No Name",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ))),
                                  SizedBox(width: 8),
                                  Container(
                                    width: 60,
                                    height: 28,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          m["score"]["fullTime"]["home"] == null
                                              ? "??"
                                              : m["score"]["fullTime"]["home"]
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          " VS ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          m["score"]["fullTime"]["away"] == null
                                              ? "??"
                                              : m["score"]["fullTime"]["away"]
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          width: 117,
                                          height: 30,
                                          child: Center(
                                              child: Text(
                                            m["awayTeam"]["shortName"] ??
                                                "No Name",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ))),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 38,
                                      height: 38,
                                      child: Utility()
                                          .buildTeamCrest(m["awayTeam"])),
                                ],
                              ),
                              Container(
                                  height: 20,
                                  child: Text(
                                    "${DateFormat.Hm().format(DateTime.parse(m["utcDate"]).add(Duration(hours: 7)))}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                height: 2,
                                color: Colors.black,
                              )
                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      )),
    );
  }

  Future<List<dynamic>> testValue() async {
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/matches/?dateFrom=${_currentDay.subtract(Duration(days: 5)).toString().substring(0, 10)}&dateTo=${_currentDay.add(Duration(days: 5)).toString().substring(0, 10)}'),
      headers: {'X-Auth-Token': getApiHere()},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)["matches"];
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}
