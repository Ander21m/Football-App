import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

class statsPage extends StatefulWidget {
  const statsPage({super.key});

  @override
  State<statsPage> createState() => _statsPageState();
}

class _statsPageState extends State<statsPage> {
  Future<Map<String, dynamic>>? standingData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    standingData = testValue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<Map<String, dynamic>>(
            future: standingData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No matches found'));
              } else {
                List<dynamic> matches = snapshot.data!["standings"][0]["table"];
                return SingleChildScrollView(
                  child: Container(
                      child: Column(

                    children: [
                      SizedBox(height: 10,),
                      Container(
                        child: Column(
                          
                          
                          children: matches.map((match) {
                            String badge = match["team"]["crest"];
                            String name = match["team"]["shortName"];
                            
                            return Column(
                                children: [
                                  Row(
                                    
                                    children: [
                                      Container(
                                          width: 25,
                                          height: 25,
                                          child: Center(
                                            child: Text(
                                              "${match["position"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        child: badge.endsWith("png") ? Image.network(badge) : SvgPicture.network(badge),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(width: 110,child: Text(name),),


                                      Container(width: 25,height: 25,child: Center(child: Text(match["playedGames"].toString()))),


                                      SizedBox(width: 5,),
                                      Container(width: 25,height: 25,child: Center(child: Text(match["won"].toString()))),

                                       SizedBox(width: 5,),
                                      Container(width: 25,height: 25,child: Center(child: Text(match["draw"].toString()))),

                                       SizedBox(width: 5,),
                                      Container(width: 25,height: 25,child: Center(child: Text(match["lost"].toString()))),


                                      SizedBox(width: 5,),
                                      Container(width: 45,height: 45,child: Center(child: Text("${match["goalsFor"]}/${match["goalsAgainst"]}"))),

                                      SizedBox(width: 5,),
                                      Container(width: 25,height: 25,child: Center(child: Text(match["goalDifference"].toString()))),

                                      SizedBox(width: 5,),
                                      Container(width: 25,height: 25,child: Center(child: Text(match["points"].toString()))),

                        
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                           
                          }).toList(),
                          
                        ),
                      ),
                      
                    ],
                  )),
                );
              }
            }));
  }

  Future<Map<String, dynamic>> testValue() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/competitions/PL/standings'),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body)["standings"][0]["table"][10]
          );
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}
