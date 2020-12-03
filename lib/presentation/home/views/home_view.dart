import 'package:amongus_generator/data/models/amongus_character.dart';
import 'package:amongus_generator/domain/getAmongUsUseCase.dart';
import 'package:amongus_generator/presentation/widgets/character.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_card/swipeable_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetAmongUsUseCase getAmongUsUseCase = GetAmongUsUseCase();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Desliza a izquierda o derecha",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getAmongUsUseCase.getAmongUsCharacters(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SwipeableWidget(
                    child:
                        CharacterAmoungUs(snapshot.data as AmongUsCharacter));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
