import 'package:flutter/material.dart';

class MedicationScheduleScreen extends StatelessWidget {
  const MedicationScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Schedule"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          buildTimelineCard(
            "08:00 AM",
            "Paracetamol",
            "500 mg",
            true,
          ),

          buildTimelineCard(
            "12:00 PM",
            "Vitamin D",
            "1000 IU",
            false,
          ),

          buildTimelineCard(
            "03:00 PM",
            "Amoxicillin",
            "250 mg",
            false,
          ),

          buildTimelineCard(
            "08:00 PM",
            "Insulin",
            "10 Units",
            false,
          ),

        ],
      ),
    );
  }

  Widget buildTimelineCard(
      String time,
      String medicine,
      String dose,
      bool completed,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 18),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
              completed ? Colors.green : Colors.blue,
          child: Icon(
            completed
                ? Icons.check
                : Icons.access_time,
            color: Colors.white,
          ),
        ),

        title: Text(
          medicine,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text("$dose\n$time"),

        trailing: ElevatedButton(
          onPressed: () {},
          child: Text(
            completed
                ? "Taken"
                : "Take",
          ),
        ),

      ),
    );
  }
}
