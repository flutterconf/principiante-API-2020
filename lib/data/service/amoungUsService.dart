import 'dart:convert';

import 'package:amongus_generator/data/models/amongus_character.dart';
import 'package:http/http.dart' as http;

class AmongUsService {
  final String _CHARACTERS =
      "https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter";

  Future<AmongUsCharacter> generateRandomCharacter() async {
    var response = await http.get(_CHARACTERS);
    return amongUsCharacterFromJson(response.body);
  }
}
