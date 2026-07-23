import 'package:flutter/material.dart';

class EmergencyHistoryScreen extends StatelessWidget {
  const EmergencyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency History"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: const [

          EmergencyHistoryCard(
            date: "22 July 2026",
            time: "08:42 PM",
            location: "Rajshahi, Bangladesh",
            status: "Resolved",
            color: Colors.green,
          ),

          EmergencyHistoryCard(
            date: "14 July 2026",
            time: "11:10 AM",
            location: "Dhaka, Bangladesh",
            status: "Cancelled",
            color: Colors.orange,
          ),

          EmergencyHistoryCard(
            date: "30 June 2026",
            time: "02:18 PM",
            location: "Rajshahi Medical College",
            status: "Emergency Sent",
            color: Colors.red,
          ),

        ],
      ),
    );
  }
}

class EmergencyHistoryCard extends StatelessWidget {

  final String date;
  final String time;
  final String location;
  final String status;
  final Color color;

  const EmergencyHistoryCard({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                Icon(
                  Icons.emergency,
                  color: color,
                ),

                const SizedBox(width: 10),

                Text(
                  status,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

              ],

            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text("Date"),
              subtitle: Text(date),
            ),

            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Time"),
              subtitle: Text(time),
            ),

            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Location"),
              subtitle: Text(location),
            ),

          ],

        ),

      ),

    );

  }

}
