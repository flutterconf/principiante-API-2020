import 'package:amongus_generator/data/models/amongus_character.dart';

abstract class AmongUsInterFace {
  Future<AmongUsCharacter> getAmongUsCharacters();
}
