import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vtm_assistant/ui/theme/theme.dart';
import 'package:vtm_assistant/utils/app_router.dart';

import 'generated/l10n.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: kDarkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
