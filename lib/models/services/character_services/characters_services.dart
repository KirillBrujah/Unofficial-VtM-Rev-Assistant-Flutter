import 'package:isar/isar.dart';
import 'package:vtm_assistant/models/models.dart';

abstract class CharactersService {
  Future<void> create(CharacterModel character);
// TODO: Delete
// TODO: Edit
}

abstract class CharactersControllerService {
  // final CharacterService characterService;
  //
  // CharacterServiceController(this.characterService);

  Future<void> create(CharacterModel character);
  // Future<void> create(CharacterModel character) async {
    // await characterService.create(character);
  // }
}
