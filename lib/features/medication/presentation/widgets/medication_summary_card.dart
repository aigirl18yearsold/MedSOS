import 'package:flutter/material.dart';

class MedicationSummaryCard extends StatelessWidget {
  const MedicationSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [

            Column(
              children: [
                Text(
                  "12",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Active"),
              ],
            ),

            Column(
              children: [
                Text(
                  "92%",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Adherence"),
              ],
            ),

            Column(
              children: [
                Text(
                  "2",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Refills"),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
