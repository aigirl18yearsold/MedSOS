import 'package:flutter/material.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Medications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Medication
        },
        child: const Icon(Icons.add),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          medicationCard(
            name: "Paracetamol",
            dosage: "500 mg",
            time: "08:00 AM",
            color: Colors.blue,
            icon: Icons.medication,
          ),

          medicationCard(
            name: "Vitamin D",
            dosage: "1000 IU",
            time: "12:00 PM",
            color: Colors.orange,
            icon: Icons.medication_liquid,
          ),

          medicationCard(
            name: "Insulin",
            dosage: "10 Units",
            time: "08:00 PM",
            color: Colors.red,
            icon: Icons.vaccines,
          ),
        ],
      ),
    );
  }

  Widget medicationCard({
    required String name,
    required String dosage,
    required String time,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text("$dosage • $time"),

        trailing: PopupMenuButton(
          itemBuilder: (context) => const [

            PopupMenuItem(
              value: "edit",
              child: Text("Edit"),
            ),

            PopupMenuItem(
              value: "delete",
              child: Text("Delete"),
            ),

          ],
        ),
      ),
    );
  }
}
