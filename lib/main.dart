import 'package:alaimtidad/Providers/Home_provider.dart';
import 'package:alaimtidad/Providers/account_provider.dart';
import 'package:alaimtidad/Screens/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

import 'Providers/edit_account_provider.dart';
import 'Providers/setting_provider.dart';

void main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await GetStorage.init();
  final storage = GetStorage();
  await storage.writeIfNull('Language', 1);
  var language = await storage.read('Language');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => home_provider()),
        ChangeNotifierProvider(create: (_) => account_provider()),
        ChangeNotifierProvider(create: (_) => setting_provider()),
        ChangeNotifierProvider(create: (_) => edit_account_provider()),
      ],
      child: MyApp(language),
    ),
  );
}

class MyApp extends StatelessWidget {
  var language;
  MyApp(this.language);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: (language == 1)
            ? const [
                Locale('ar', 'AE'),
              ]
            : const [
                Locale('en', ''),
              ],
        locale:
            (language == 1) ? const Locale('ar', 'AE') : const Locale('en', ''),
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          splashColor: Colors
              .transparent, // The highlight effect when clicking is set to transparent
          highlightColor: Colors
              .transparent, // The long-term diffusion effect is set to transparent
        ),
        home: const bottomNavigationBar());
  }
}
