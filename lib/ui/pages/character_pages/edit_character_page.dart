import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/models/models.dart';

import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class EditCharacterPage extends StatelessWidget {
  const EditCharacterPage({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: character.name,
      ),
    );
  }
}
