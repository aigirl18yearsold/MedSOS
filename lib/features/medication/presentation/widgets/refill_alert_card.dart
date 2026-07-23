import 'package:flutter/material.dart';

class RefillAlertCard extends StatelessWidget {
  const RefillAlertCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.orange.shade50,
      child: const ListTile(
        leading: Icon(
          Icons.warning,
          color: Colors.orange,
        ),
        title: Text("Refill Needed"),
        subtitle: Text(
          "Vitamin D has only 3 doses remaining.",
        ),
      ),
    );
  }
}
