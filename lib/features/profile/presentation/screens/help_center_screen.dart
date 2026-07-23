import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  Future<void> _launchUrl(String url) async {
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
        title: const Text("Help Center"),
      ),
      body: ListView(
        children: [

          const SizedBox(height: 10),

          const ListTile(
            title: Text(
              "Support",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text("Frequently Asked Questions"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text("User Guide"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Contact Support"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _launchUrl("mailto:support@medsos.app");
            },
          ),

          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text("Report a Bug"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _launchUrl("mailto:bugs@medsos.app");
            },
          ),

          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Live Chat (Coming Soon)"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const Divider(),

          const ListTile(
            title: Text(
              "Emergency Resources",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text("Emergency Instructions"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.health_and_safety),
            title: const Text("Medication Safety Tips"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Questions"),
            onTap: () {},
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
