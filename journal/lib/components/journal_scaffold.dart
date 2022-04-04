import 'package:flutter/material.dart';
import 'package:journal/components/settings_drawer.dart';

class JournalScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? floatingActionButton;

  const JournalScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SettingsDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(title),
        ),
        leading: (ModalRoute.of(context)?.canPop ?? false)
            ? const BackButton()
            : null,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: (() => Scaffold.of(context).openEndDrawer()),
              icon: const Icon(Icons.settings),
            );
          }),
        ],
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
