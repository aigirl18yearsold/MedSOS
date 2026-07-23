import 'package:flutter/material.dart';

class RefillTrackerScreen extends StatelessWidget {
  const RefillTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refill Tracker"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RefillCard(
            medicine: "Paracetamol",
            remaining: 18,
            total: 30,
            color: Colors.green,
          ),
          RefillCard(
            medicine: "Vitamin D",
            remaining: 6,
            total: 30,
            color: Colors.orange,
          ),
          RefillCard(
            medicine: "Insulin",
            remaining: 2,
            total: 20,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class RefillCard extends StatelessWidget {
  final String medicine;
  final int remaining;
  final int total;
  final Color color;

  const RefillCard({
    super.key,
    required this.medicine,
    required this.remaining,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final progress = remaining / total;

    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              medicine,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: progress,
              color: color,
            ),

            const SizedBox(height: 10),

            Text(
              "$remaining of $total doses remaining",
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to refill page
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text("Refill Medication"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
