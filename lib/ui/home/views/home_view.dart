import 'dart:convert';

import 'package:amongus_generator/core/models/amongus_character.dart';
import 'package:amongus_generator/ui/widgets/character.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  final Future<AmongUsCharacter> futureCharacter;

  const HomeView({Key key, this.futureCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Desliza a izquierda o derecha',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 48,
              ),
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.green,
                size: 48,
              ),
            ],
          ),
          Column(
            children: [
              Center(
                  child: FutureBuilder<AmongUsCharacter>(
                      future: futureCharacter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Character(
                            amongUsCharacter: snapshot.data,
                          );
                        } else {
                          return Text("Loading...");
                        }
                      }))
            ],
          )
        ],
      ),
    );
  }

  Future<AmongUsCharacter> fetchCharacter() async {
    final response = await http.get(
        'https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AmongUsCharacter.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
