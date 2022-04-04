import 'package:flutter/material.dart';
import '../components/dark_mode_switch_list_tile.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Center(
                  child: Text('Settings',
                      style: Theme.of(context).textTheme.headline6))),
          const DarkModeSwitchListTile()
        ],
      ),
    );
  }
}
