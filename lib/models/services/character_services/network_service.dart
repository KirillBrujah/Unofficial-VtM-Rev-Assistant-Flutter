import 'package:vtm_assistant/models/models.dart';

class NetworkCharactersService implements CharactersService {
  // TODO: DioClient with requests

  NetworkCharactersService();

  @override
  Future<void> create(CharacterModel character) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    throw "TEST NETWORK ERROR";
  }
}
