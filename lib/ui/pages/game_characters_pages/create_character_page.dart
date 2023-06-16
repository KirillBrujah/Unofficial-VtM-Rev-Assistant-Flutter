import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class CreateCharacterPage extends StatelessWidget {
  const CreateCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).create_character),
    );
  }
}
