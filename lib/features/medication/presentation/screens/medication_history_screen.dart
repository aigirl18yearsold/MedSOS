import 'package:flutter/material.dart';

class MedicationHistoryScreen extends StatelessWidget {
  const MedicationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication History"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: const [

          HistoryCard(
            medicine: "Paracetamol",
            time: "Today • 8:00 AM",
            status: "Taken",
            color: Colors.green,
            icon: Icons.check_circle,
          ),

          HistoryCard(
            medicine: "Vitamin D",
            time: "Yesterday • 12:00 PM",
            status: "Missed",
            color: Colors.red,
            icon: Icons.cancel,
          ),

          HistoryCard(
            medicine: "Insulin",
            time: "Yesterday • 8:00 PM",
            status: "Skipped",
            color: Colors.orange,
            icon: Icons.skip_next,
          ),

          HistoryCard(
            medicine: "Amoxicillin",
            time: "2 Days Ago • 9:00 AM",
            status: "Taken",
            color: Colors.green,
            icon: Icons.check_circle,
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String medicine;
  final String time;
  final String status;
  final Color color;
  final IconData icon;

  const HistoryCard({
    super.key,
    required this.medicine,
    required this.time,
    required this.status,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        title: Text(
          medicine,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(time),

        trailing: Text(
          status,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
