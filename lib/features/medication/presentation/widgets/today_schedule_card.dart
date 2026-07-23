import 'package:flutter/material.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.schedule),
        ),
        title: const Text("Next Dose"),
        subtitle: const Text(
          "Paracetamol • 9:00 PM",
        ),
        trailing: FilledButton(
          onPressed: () {},
          child: const Text("Taken"),
        ),
      ),
    );
  }
}
