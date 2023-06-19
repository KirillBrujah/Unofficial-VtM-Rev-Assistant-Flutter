import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class GameCharacterDetailsPage extends StatelessWidget {
  const GameCharacterDetailsPage({Key? key, required this.gameCharacter})
      : super(key: key);

  final GameCharacter gameCharacter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: gameCharacter.name,
        // TODO: Edit action
      ),
    );
  }
}
