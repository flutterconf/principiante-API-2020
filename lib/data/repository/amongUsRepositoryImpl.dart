import 'package:amongus_generator/data/models/amongus_character.dart';
import 'package:amongus_generator/data/repository/AmongUsInterface.dart';
import 'package:amongus_generator/data/service/amoungUsService.dart';

class AmongUsRepositoryImpl extends AmongUsInterFace {
  AmongUsService amongUsService = AmongUsService();

  @override
  Future<AmongUsCharacter> getAmongUsCharacters() {
    return amongUsService.generateRandomCharacter();
  }
}
