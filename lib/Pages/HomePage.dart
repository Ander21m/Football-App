import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List liveMatches = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testValue();
  }

  @override
  Widget build(BuildContext context) {
    if (liveMatches.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.green,)
      );
    } else {
      return Column(
        children: [
          Container(
            color: Color.fromARGB(255, 83, 252, 45),
            child: Row(
              children: [
                Container(
                  width: 150,
                  margin: EdgeInsets.fromLTRB(25, 15, 15, 20),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 50,
                          height: 80,
                          child: Image.network(
                              liveMatches[0]["homeTeam"]["crest"])),
                      Text(
                        liveMatches[0]["homeTeam"]["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  " vs ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  width: 150,
                  margin: EdgeInsets.fromLTRB(15, 15, 25, 20),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 50,
                          height: 80,
                          child: Image.network(
                              liveMatches[0]["awayTeam"]["crest"])),
                      Text(liveMatches[0]["awayTeam"]["name"],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 70,height: 70,margin: EdgeInsets.fromLTRB(0, 0, 20, 0),child: Image.asset("images/test.jpg")),
                  Text("Hello This is football app",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)
                ],
              ))
        ],
      );
    }
    // TODO: implement build
  }

  Future<void> testValue() async {
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/competitions/CL/matches/?status=SCHEDULED'),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      setState(() {
        liveMatches = json.decode(response.body)["matches"];
        //print(liveMatches[0]);
      });
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}
