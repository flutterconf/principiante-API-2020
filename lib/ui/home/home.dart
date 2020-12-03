import 'package:flutter/material.dart';

import 'package:amongus_generator/ui/home/views/favorites_view.dart';
import 'package:amongus_generator/ui/home/views/home_view.dart';

import 'package:amongus_generator/ui/home/home.dart';
import 'package:amongus_generator/core/models/amongus_character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Future<AmongUsCharacter> futureCharacter;

  @override
  void initState() {
    super.initState();
    futureCharacter = fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353535),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Among Us Generator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: IndexedStack(
        children: [HomeView(futureCharacter: futureCharacter,), FavoritesView()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

Future<AmongUsCharacter> fetchCharacter() async {
  final response = await http.get('https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter');

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
