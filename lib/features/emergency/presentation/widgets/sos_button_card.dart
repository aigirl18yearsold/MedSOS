import 'package:flutter/material.dart';

class SOSButtonCard extends StatelessWidget {
  const SOSButtonCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      color: Colors.red.shade50,

      child: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          children: [

            const Icon(
              Icons.sos,
              color: Colors.red,
              size: 70,
            ),

            const SizedBox(height:15),

            const Text(
              "Emergency SOS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "Notify your trusted contacts and share your live location instantly.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height:20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // TODO:
                  // Trigger SOS workflow
                },
                icon: const Icon(Icons.warning),
                label: const Text("SEND SOS"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
