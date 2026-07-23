import 'package:flutter/material.dart';

class SOSCard extends StatelessWidget {
  const SOSCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.red.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(
              Icons.sos,
              size: 60,
              color: Colors.red,
            ),

            const SizedBox(height: 15),

            const Text(
              "Emergency SOS",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Immediately notify your emergency contacts and share your live location.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                icon: const Icon(Icons.warning),
                label: const Text("Send SOS"),
                onPressed: () {
                  // TODO:
                  // Trigger Emergency Workflow
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
