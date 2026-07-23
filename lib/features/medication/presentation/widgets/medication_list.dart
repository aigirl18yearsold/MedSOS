import 'package:flutter/material.dart';

class MedicationList extends StatelessWidget {
  const MedicationList({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.medication),
            ),
            title: const Text("Paracetamol"),
            subtitle: const Text(
              "500 mg • Twice Daily",
            ),
            trailing: PopupMenuButton(
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: 1,
                  child: Text("Edit"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Delete"),
                ),
              ],
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.medication),
            ),
            title: const Text("Vitamin D"),
            subtitle: const Text(
              "1 Tablet • Morning",
            ),
            trailing: PopupMenuButton(
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: 1,
                  child: Text("Edit"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Delete"),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
