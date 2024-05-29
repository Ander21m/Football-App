import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: matches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No matches found'));
          } else {
            return Container(
                color: Colors.green,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final match = snapshot.data![index];
                    return ListTile(
                      title: Text(
                          '${match["homeTeam"]["name"]} ${match["score"]["fullTime"]["home"]} vs ${match["score"]["fullTime"]["away"]}  ${match["awayTeam"]["name"]} '),
                      subtitle: Text(
                          'Date: ${DateTime.parse(match["utcDate"]).add(Duration(hours: 7))}'),
                    );
                  },
                ));
          }
        },
      ),
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
