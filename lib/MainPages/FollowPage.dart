import 'dart:convert';

import 'package:flutter/material.dart';
import 'Utility/Info/api.dart';

import 'package:http/http.dart' as http;
class followPage extends StatefulWidget {
  const followPage({super.key});

  @override
  State<followPage> createState() => _followPageState();
}

class _followPageState extends State<followPage> {
  Future<Map<String,dynamic>>? test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test = Test("http://api.football-data.org/v4/matches/?dateFrom=2024-06-09&dateTo=2024-06-19");
  }
  @override
  Widget build(BuildContext context) {
   
    return const Text('text');
  }

  Future<Map<String, dynamic>> Test(String apiurl) async {
    final response = await http.get(
      Uri.parse(apiurl),
      headers: {'X-Auth-Token':getApiHere()},
    );
    if (response.statusCode == 200) {
    print(json.decode(response.body)["matches"][32]);
   
      
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load live scores');
    }
  }
}