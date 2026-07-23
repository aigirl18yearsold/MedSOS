import 'package:flutter/material.dart';

class SendSOSScreen extends StatefulWidget {
  const SendSOSScreen({super.key});

  @override
  State<SendSOSScreen> createState() => _SendSOSScreenState();
}

class _SendSOSScreenState extends State<SendSOSScreen> {

  bool sending = false;

  final List<String> contacts = [
    "+8801700000000",
    "+8801800000000",
  ];

  final String emergencyMessage =
      "🚨 EMERGENCY!\n\n"
      "I need immediate help.\n\n"
      "My current location:\n"
      "https://maps.google.com/?q=23.8103,90.4125";

  Future<void> sendSOS() async {

    setState(() {
      sending = true;
    });

    // TODO:
    // Send SMS to every emergency contact

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      sending = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Emergency message sent successfully.",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Send Emergency Alert"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Emergency Message",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Text(
                  emergencyMessage,
                ),

              ),

            ),

            const SizedBox(height: 30),

            const Text(
              "Recipients",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(

              child: ListView.builder(

                itemCount: contacts.length,

                itemBuilder: (_, index) {

                  return ListTile(

                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),

                    title: Text(contacts[index]),

                    trailing:
                        const Icon(Icons.sms),

                  );

                },

              ),

            ),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: FilledButton.icon(

                onPressed:
                    sending ? null : sendSOS,

                icon: const Icon(Icons.send),

                label: Text(

                  sending
                      ? "Sending..."
                      : "Send SOS",

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
