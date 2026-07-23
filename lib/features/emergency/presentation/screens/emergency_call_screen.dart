import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallScreen extends StatelessWidget {
  const EmergencyCallScreen({super.key});

  Future<void> makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Emergency Call"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          const SizedBox(height: 20),

          const Icon(
            Icons.call,
            size: 100,
            color: Colors.red,
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Emergency Numbers",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          buildContact(
            "🚑 Ambulance",
            "999",
          ),

          buildContact(
            "👮 Police",
            "999",
          ),

          buildContact(
            "🔥 Fire Service",
            "999",
          ),

          buildContact(
            "👩 Mother",
            "+8801700000000",
          ),

          buildContact(
            "👨 Father",
            "+8801800000000",
          ),

        ],

      ),

    );

  }

  Widget buildContact(
    String title,
    String phone,
  ) {

    return Card(

      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(

        leading: const CircleAvatar(
          child: Icon(Icons.phone),
        ),

        title: Text(title),

        subtitle: Text(phone),

        trailing: ElevatedButton(

          onPressed: () {

            makeCall(phone);

          },

          child: const Text("Call"),

        ),

      ),

    );

  }

}
