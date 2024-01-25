import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/themprovider.dart';
import 'Views/Screens/Detils_page.dart';
import 'Views/Screens/Home_Page.dart';
import 'Views/Screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<themeprovider>(create: (context) => themeprovider()),
      ],
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          darkTheme: ThemeData.dark(),
          themeMode:
              (Provider.of<themeprovider>(context, listen: true).theme.isdark ==
                      false)
                  ? ThemeMode.dark
                  : ThemeMode.light,
          routes: {
            '/': (ctx) => const Splash(),
            'home': (ctx) => const HomeScreen(),
            'Detils': (ctx) => const Detils_Page(),
          }),
    );
  }
}
