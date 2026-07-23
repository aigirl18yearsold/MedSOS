import 'package:flutter/material.dart';

class AIAssistantCard extends StatelessWidget {

  const AIAssistantCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      color: Colors.blue.shade50,

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Row(

              children: [

                Icon(
                  Icons.smart_toy,
                  color: Colors.blue,
                ),

                SizedBox(width:10),

                Text(
                  "AI Healthcare Assistant",
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],

            ),

            const SizedBox(height:15),

            const Text(
              "How can I help you today?",
            ),

            const SizedBox(height:20),

            Wrap(

              spacing: 10,

              runSpacing: 10,

              children: [

                ActionChip(
                  label: const Text("AI Chat"),
                  onPressed: () {},
                ),

                ActionChip(
                  label: const Text("Scan Prescription"),
                  onPressed: () {},
                ),

                ActionChip(
                  label: const Text("Identify Pill"),
                  onPressed: () {},
                ),

                ActionChip(
                  label: const Text("Health Tips"),
                  onPressed: () {},
                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}
