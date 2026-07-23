import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsPrivacyScreen extends StatelessWidget {
  const TermsPrivacyScreen({super.key});

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Terms & Privacy"),
      ),

      body: ListView(

        children: [

          const SizedBox(height: 10),

          const ListTile(
            title: Text(
              "Legal Documents",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Terms of Service"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              openLink(
                "https://yourwebsite.com/terms",
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              openLink(
                "https://yourwebsite.com/privacy",
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text("Open Source Licenses"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showLicensePage(
                context: context,
              );
            },
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Your health data is stored securely. "
              "MedSOS only shares emergency information "
              "when you explicitly activate an SOS or "
              "grant permission.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

        ],

      ),

    );

  }

}
