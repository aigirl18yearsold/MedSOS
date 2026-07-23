import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 3,

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: const [

                Icon(Icons.medication),

                SizedBox(width:10),

                Text(
                  "Today's Medications",
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
                child: Icon(Icons.medication),
              ),
              title: Text("Paracetamol"),
              subtitle: Text("500mg • 9:00 AM"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),

            Divider(),

            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.medication),
              ),
              title: Text("Vitamin D"),
              subtitle: Text("1 Tablet • 2:00 PM"),
              trailing: Icon(
                Icons.schedule,
                color: Colors.orange,
              ),
            ),

            Divider(),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // View All Medications
                },
                child: const Text("View All"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
