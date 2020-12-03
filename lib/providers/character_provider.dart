import '../core/models/amongus_character.dart';
import 'package:http/http.dart' as http;

class _CharacterProvider {
  final _url =
      'https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter';

  Future<AmongUsCharacter> get amongUsCharacter async {
    final answer = await http.get(_url);

    return amongUsCharacterFromJson(answer.body);
  }
}

final characterProvider = _CharacterProvider();
