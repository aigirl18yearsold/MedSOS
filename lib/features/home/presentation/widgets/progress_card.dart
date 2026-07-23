import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {

  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Weekly Progress",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:20),

            LinearProgressIndicator(
              value: .92,
              minHeight: 12,
              borderRadius: BorderRadius.circular(20),
            ),

            const SizedBox(height:15),

            const Text(
              "92% Medication Adherence",
            ),

            const SizedBox(height:8),

            const Text(
              "Excellent! Keep maintaining your healthy routine.",
            ),

          ],

        ),

      ),

    );

  }

}
