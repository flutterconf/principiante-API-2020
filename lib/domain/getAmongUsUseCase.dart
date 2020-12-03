import 'package:amongus_generator/data/models/amongus_character.dart';
import 'package:amongus_generator/data/repository/amongUsRepositoryImpl.dart';

class GetAmongUsUseCase {
  final repository = AmongUsRepositoryImpl();

  Future<AmongUsCharacter> getAmongUsCharacters() async {
    return repository.getAmongUsCharacters();
  }
}
