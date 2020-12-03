import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import '../core/models/amongus_character.dart';

class PersonajesBloc {
  final streamController = StreamController.broadcast();

  Stream get getStream => streamController.stream;

  final Map data = {
    'enPantalla': null,
    'favoritos': []
  };

  void pedirPersonaje() async {
    http.Response response = await http.get(
      'https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      data['enPantalla'] = amongUsCharacterFromJson(response.body);
    }
  }

  void guardarPersonaje() {

  }
}

final personajesBloc = PersonajesBloc();