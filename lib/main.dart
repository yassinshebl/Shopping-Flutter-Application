import 'package:flutter/material.dart';
import 'package:shopping_app/l10n/app_localizations.dart';
import 'package:shopping_app/screens/user_info_screen.dart';

import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('ar')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routes: {
        '/': (_) => WelcomeScreen(onToggleLang: _toggleLocale),
        '/signup': (_) => const SignUpScreen(),
        '/signin': (_) => const SignInScreen(),
        '/home': (_) => HomeScreen(onToggleLang: _toggleLocale),
        '/userinfo': (_) => const UserInfoScreen(),
      },
    );
  }
}
