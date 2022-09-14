import 'package:alaimtidad/Providers/Home_provider.dart';
import 'package:alaimtidad/Providers/account_provider.dart';
import 'package:alaimtidad/Screens/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

import 'Providers/categories_provider.dart';
import 'Providers/edit_account_provider.dart';
import 'Providers/entertainment_provider.dart';
import 'Providers/notifications_provider.dart';
import 'Providers/reports_providers.dart';
import 'Providers/setting_provider.dart';
import 'Providers/tasks_provider.dart';

void main() async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => home_provider()),
        ChangeNotifierProvider(create: (_) => account_provider()),
        ChangeNotifierProvider(create: (_) => setting_provider()),
        ChangeNotifierProvider(create: (_) => edit_account_provider()),
        ChangeNotifierProvider(create: (_) => notifications_provider()),
        ChangeNotifierProvider(create: (_) => reports_provider()),
        ChangeNotifierProvider(create: (_) => tasks_provider()),
        ChangeNotifierProvider(create: (_) => categories_provider()),
        ChangeNotifierProvider(create: (_) => entertainment_provider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late var language = -1;

  Future<void> getlanguage() async {
    final storage = GetStorage();
    await storage.writeIfNull('Language', 1);
    var temp = await storage.read('Language');

    setState(() {
      language = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    getlanguage();
  }

  @override
  Widget build(BuildContext context) {
    return (language == -1)
        ? Container()
        : MaterialApp(
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
            locale: (language == 1)
                ? const Locale('ar', 'AE')
                : const Locale('en', ''),
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
