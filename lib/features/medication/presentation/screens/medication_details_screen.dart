import 'package:flutter/material.dart';

class MedicationDetailsScreen extends StatelessWidget {
  final String name;
  final String dosage;
  final String category;
  final String schedule;
  final String notes;

  const MedicationDetailsScreen({
    super.key,
    required this.name,
    required this.dosage,
    required this.category,
    required this.schedule,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to Edit Screen
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.medication,
              size: 50,
            ),
          ),

          const SizedBox(height: 25),

          Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Category"),
              subtitle: Text(category),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.medication),
              title: const Text("Dosage"),
              subtitle: Text(dosage),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text("Schedule"),
              subtitle: Text(schedule),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.note),
              title: const Text("Notes"),
              subtitle: Text(notes.isEmpty ? "No notes" : notes),
            ),
          ),

          const SizedBox(height: 40),

          ElevatedButton.icon(
            onPressed: () {
              // Mark as Taken
            },
            icon: const Icon(Icons.check_circle),
            label: const Text("Mark as Taken"),
          ),

          const SizedBox(height: 15),

          OutlinedButton.icon(
            onPressed: () {
              // Skip Dose
            },
            icon: const Icon(Icons.skip_next),
            label: const Text("Skip Dose"),
          ),

          const SizedBox(height: 15),

          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              // Delete Medication
            },
            icon: const Icon(Icons.delete),
            label: const Text("Delete Medication"),
          ),
        ],
      ),
    );
  }
}
