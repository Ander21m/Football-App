import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class matchPage extends StatefulWidget {
  const matchPage({super.key});

  @override
  State<matchPage> createState() => _matchPageState();
}

class _matchPageState extends State<matchPage> {
  Future<List<dynamic>>? matches;

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
                      vertical: ((MediaQuery.of(context).size.height -160 )) / 2),
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
                        vertical: ((MediaQuery.of(context).size.height -160) ) / 2),
                    child: Center(child: Text('Error: ${snapshot.error}'))),
              ],
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ((MediaQuery.of(context).size.height -160 )/2 )),
                    child: Center(child: Text('No matches found'))),
              ],
            );
          } else {
            return Column(
              children: snapshot.data!.map((match) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 20,
                        child: Text(
                          match["competition"]["name"],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: 38,
                            height: 38,
                            child: match["homeTeam"]["crest"].endsWith("png")
                                ? Image.network(match["homeTeam"]["crest"])
                                : SvgPicture.network(
                                    match["homeTeam"]["crest"])),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 117,
                            height: 30,
                            child: Center(
                                child: Text(
                              match["homeTeam"]["shortName"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))),
                        SizedBox(width: 8),
                        Container(
                          width: 60,
                          height: 28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                match["score"]["fullTime"]["home"] == null
                                    ? "??"
                                    : match["score"]["fullTime"]["home"]
                                        .toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " VS ",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                match["score"]["fullTime"]["away"] == null
                                    ? "??"
                                    : match["score"]["fullTime"]["away"]
                                        .toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
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
                                  match["awayTeam"]["shortName"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ))),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: 38,
                            height: 38,
                            child: match["awayTeam"]["crest"].endsWith("png")
                                ? Image.network(match["awayTeam"]["crest"])
                                : SvgPicture.network(
                                    match["awayTeam"]["crest"])),
                      ],
                    ),
                    Container(
                        height: 20,
                        child: Text(
                          "${DateFormat.Hm().format(DateTime.parse(match["utcDate"]).add(Duration(hours: 7)))}",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Container(
                      height: 2,
                      color: Colors.black,
                    )
                  ],
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
      Uri.parse('http://api.football-data.org/v4/matches'),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      
      return json.decode(response.body)["matches"];
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}
