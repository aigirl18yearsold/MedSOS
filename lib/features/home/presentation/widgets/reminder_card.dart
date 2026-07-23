import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Row(

              children: [

                Icon(Icons.alarm),

                SizedBox(width:10),

                Text(
                  "Next Reminder",
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],

            ),

            const SizedBox(height:20),

            ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: const Icon(Icons.schedule),
              ),

              title: const Text("Vitamin D"),

              subtitle: const Text(
                "Today • 2:00 PM",
              ),

              trailing: FilledButton(
                onPressed: () {},
                child: const Text("Taken"),
              ),

            ),

            const SizedBox(height:10),

            LinearProgressIndicator(
              value: .45,
              borderRadius: BorderRadius.circular(20),
            ),

            const SizedBox(height:10),

            const Text(
              "2 hours remaining",
            ),

          ],

        ),

      ),

    );

  }

}
