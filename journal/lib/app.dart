import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart';
import 'screens/new_journal_entry.dart';

class App extends StatefulWidget {
  final SharedPreferences preferences;

  static final routes = {
    WelcomeScreen.routeName: (context) => const WelcomeScreen(),
    NewJournalEntry.routeName: (context) => const NewJournalEntry(),
    JournalEntriesScreen.routeName: (context) => const JournalEntriesScreen()
  };

  const App({Key? key, required this.preferences}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static const DARK_MODE_ENABLED_KEY = 'darkModeEnabled';

  bool get darkModeEnabled =>
      widget.preferences.getBool(DARK_MODE_ENABLED_KEY) ?? false;

  void toggleDarkMode(bool value) {
    setState(() {
      widget.preferences.setBool(DARK_MODE_ENABLED_KEY, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      routes: App.routes,
      initialRoute: JournalEntriesScreen.routeName,
    );
  }
}
