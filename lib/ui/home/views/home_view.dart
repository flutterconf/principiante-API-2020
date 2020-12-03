import 'package:amongus_generator/providers/character_provider.dart';
import 'package:flutter/material.dart';

import '../../../core/models/amongus_character.dart';
import '../../../core/models/amongus_character.dart';
import '../../../core/models/amongus_character.dart';
import '../../widgets/character.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<AmongUsCharacter> amongCharacter;
  AmongUsCharacter actualCharacter;

  List<AmongUsCharacter> favourites = List();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Desliza a izquierda o derecha',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.highlight_off,
                color: Colors.red,
                size: 50,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.green,
                size: 50,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: Center(
            child: FutureBuilder(
              future: amongCharacter,
              builder: (context, snapshot) => Character(
                amongUsCharacter: actualCharacter =
                    snapshot.hasData ? snapshot.data : null,
              ),
            ),
          ),
          onHorizontalDragEnd: (datails) => setState(
            () => newCharacter(),
          ),
          onHorizontalDragStart: (dateils) => setState(() {
            favourites.add(actualCharacter);
            newCharacter();
          }),
        ),
      ],
    );
  }

  void newCharacter() => amongCharacter = characterProvider.amongUsCharacter;
}
