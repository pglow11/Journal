import 'package:flutter/material.dart';
import '../app.dart';

class DarkModeSwitchListTile extends StatefulWidget {
  const DarkModeSwitchListTile({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkModeSwitchListTile> createState() => _DarkModeSwitchListTileState();
}

class _DarkModeSwitchListTileState extends State<DarkModeSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();

    return SwitchListTile(
        title: const Text('Enable dark mode'),
        value: appState!.darkModeEnabled,
        onChanged: (bool value) {
          appState.toggleDarkMode(value);
          setState(() {});
        });
  }
}
