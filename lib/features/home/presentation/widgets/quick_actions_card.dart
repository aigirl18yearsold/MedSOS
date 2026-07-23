import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {

  const QuickActionsCard({super.key});

  Widget action(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return Expanded(

      child: InkWell(

        borderRadius: BorderRadius.circular(16),

        onTap: onTap,

        child: Padding(

          padding: const EdgeInsets.all(12),

          child: Column(

            children: [

              CircleAvatar(
                radius: 28,
                child: Icon(icon),
              ),

              const SizedBox(height:10),

              Text(
                title,
                textAlign: TextAlign.center,
              ),

            ],

          ),

        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:20),

            Row(

              children: [

                action(
                  Icons.add_circle,
                  "Add\nMedicine",
                  () {},
                ),

                action(
                  Icons.smart_toy,
                  "AI\nChat",
                  () {},
                ),

                action(
                  Icons.document_scanner,
                  "Scan\nPrescription",
                  () {},
                ),

                action(
                  Icons.people,
                  "Emergency\nContacts",
                  () {},
                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}
