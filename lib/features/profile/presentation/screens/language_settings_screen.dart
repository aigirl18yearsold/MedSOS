import 'package:flutter/material.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() =>
      _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState
    extends State<LanguageSettingsScreen> {

  String selectedLanguage = "English";

  final List<String> languages = [
    "English",
    "বাংলা",
    "हिन्दी",
    "اردو",
    "Español",
    "Français",
    "العربية",
    "中文",
    "日本語",
    "한국어",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Language"),
      ),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: languages.length,

              itemBuilder: (context, index) {

                final language = languages[index];

                return RadioListTile<String>(

                  title: Text(language),

                  value: language,

                  groupValue: selectedLanguage,

                  onChanged: (value) {

                    setState(() {

                      selectedLanguage = value!;

                    });

                  },

                );

              },

            ),

          ),

          Padding(

            padding: const EdgeInsets.all(20),

            child: SizedBox(

              width: double.infinity,

              height: 55,

              child: FilledButton(

                onPressed: () {

                  // Save language

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
