import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class matchPage extends StatefulWidget {
  const matchPage({super.key});

  @override
  State<matchPage> createState() => _matchPageState();
}

class _matchPageState extends State<matchPage> {
  List matches = [];
  
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testValue();
    
  }

  @override
  Widget build(BuildContext context) {
    if(matches.isEmpty){
      return const Center(child: CircularProgressIndicator(color: Colors.green,));
    }
    else{
      return Container(
      color: Colors.green,
      child:  Column(

        children: [
          
          Text(matches[0]["homeTeam"]["name"] + " " + matches[0]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[0]["score"]["fullTime"]["away"].toString()+ " "+ matches[0]["awayTeam"]["name"]?? ""),
          Text(matches[1]["homeTeam"]["name"] + " " + matches[1]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[1]["score"]["fullTime"]["away"].toString()+ " "+ matches[1]["awayTeam"]["name"]?? ""),
          Text(matches[2]["homeTeam"]["name"] + " " + matches[2]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[2]["score"]["fullTime"]["away"].toString()+ " "+ matches[2]["awayTeam"]["name"]?? ""),
          Text(matches[3]["homeTeam"]["name"] + " " + matches[3]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[3]["score"]["fullTime"]["away"].toString()+ " "+ matches[3]["awayTeam"]["name"]?? ""),
          Text(matches[4]["homeTeam"]["name"] + " " + matches[4]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[4]["score"]["fullTime"]["away"].toString()+ " "+ matches[4]["awayTeam"]["name"]?? ""),
          Text(matches[5]["homeTeam"]["name"] + " " + matches[5]["score"]["fullTime"]["home"].toString()+ " vs " +  matches[5]["score"]["fullTime"]["away"].toString()+ " "+ matches[5]["awayTeam"]["name"]?? ""),

          Row(
            children: [Text("Hello")],
          )
        ],
      ),
    );
  }

  
    
  }

  Future<void> testValue() async {
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/competitions/PL/matches/?matchday=38'),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      setState(() {
        matches = json.decode(response.body)["matches"];

        
      });
    } else {
      throw Exception('Failed to load live scores');
    }
    }
}