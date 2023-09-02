import 'package:isar/isar.dart';
import 'package:vtm_assistant/models/models.dart';

abstract class CharacterService {
  Future<void> create(CharacterModel character);
// TODO: Delete
// TODO: Edit
}

abstract class CharacterServiceController {
  final CharacterService characterService;

  CharacterServiceController(this.characterService);

  Future<void> create(CharacterModel character) async {
    await characterService.create(character);
  }
}
