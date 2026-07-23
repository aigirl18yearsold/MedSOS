import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() =>
      _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState
    extends State<ThemeSettingsScreen> {

  AppThemeMode selectedTheme = AppThemeMode.system;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Theme Settings"),
      ),

      body: Column(

        children: [

          RadioListTile<AppThemeMode>(
            value: AppThemeMode.system,
            groupValue: selectedTheme,
            title: const Text("System Default"),
            subtitle: const Text(
              "Follow your device theme",
            ),
            onChanged: (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          RadioListTile<AppThemeMode>(
            value: AppThemeMode.light,
            groupValue: selectedTheme,
            title: const Text("Light Mode"),
            subtitle: const Text(
              "Always use light theme",
            ),
            onChanged: (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          RadioListTile<AppThemeMode>(
            value: AppThemeMode.dark,
            groupValue: selectedTheme,
            title: const Text("Dark Mode"),
            subtitle: const Text(
              "Always use dark theme",
            ),
            onChanged: (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  // Save theme preference
                },
                child: const Text("Save"),
              ),
            ),
          ),

        ],

      ),

    );

  }

}
