import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
class statsPage extends StatefulWidget {
  const statsPage({super.key});

  @override
  State<statsPage> createState() => _statsPageState();
}

class _statsPageState extends State<statsPage> {

  List standingData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testValue();
  }
  @override
  Widget build(BuildContext context) {
    if(standingData.isEmpty){
      return const Center(child: CircularProgressIndicator(color: Colors.green,));
    }
    else{
      return Text(standingData[0]["table"][7]["team"]["name"]);
    }
  }

   Future<void> testValue() async {
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/competitions/PL/standings'),
      headers: {'X-Auth-Token': '5213826a7f66402a9840bbfd3a78c20d'},
    );
    if (response.statusCode == 200) {
      setState(() {
        standingData = json.decode(response.body)["standings"];
        
      });
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}