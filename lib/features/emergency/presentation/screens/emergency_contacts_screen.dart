import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState
    extends State<EmergencyContactsScreen> {

  final List<Map<String, String>> contacts = [
    {
      "name": "Mother",
      "phone": "+8801XXXXXXXXX",
    },
    {
      "name": "Father",
      "phone": "+8801XXXXXXXXX",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Emergency Contacts"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add Contact
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(

        itemCount: contacts.length,

        itemBuilder: (context, index) {

          final contact = contacts[index];

          return Card(

            margin: const EdgeInsets.all(12),

            child: ListTile(

              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),

              title: Text(contact["name"]!),

              subtitle: Text(contact["phone"]!),

              trailing: PopupMenuButton(

                itemBuilder: (context) => const [

                  PopupMenuItem(
                    value: "edit",
                    child: Text("Edit"),
                  ),

                  PopupMenuItem(
                    value: "delete",
                    child: Text("Delete"),
                  ),

                ],

              ),

            ),

          );

        },

      ),

    );

  }

}
