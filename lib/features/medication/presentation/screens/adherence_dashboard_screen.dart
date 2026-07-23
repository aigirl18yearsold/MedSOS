import 'package:flutter/material.dart';

class AdherenceDashboardScreen extends StatelessWidget {
  const AdherenceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication Adherence"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Column(

                  children: [

                    const Text(
                      "Overall Adherence",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 170,
                      width: 170,

                      child: CircularProgressIndicator(
                        value: 0.92,
                        strokeWidth: 12,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "92%",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "Excellent",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 25),

            buildTile(
              Icons.check_circle,
              Colors.green,
              "Taken",
              "138 doses",
            ),

            buildTile(
              Icons.schedule,
              Colors.orange,
              "Missed",
              "8 doses",
            ),

            buildTile(
              Icons.skip_next,
              Colors.blue,
              "Skipped",
              "4 doses",
            ),

            buildTile(
              Icons.local_hospital,
              Colors.purple,
              "Current Streak",
              "27 Days",
            ),

          ],

        ),

      ),

    );
  }

  Widget buildTile(
    IconData icon,
    Color color,
    String title,
    String value,
  ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
