import 'package:flutter/material.dart';

class EmergencyContactsCard extends StatelessWidget {
  const EmergencyContactsCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        children: [

          const ListTile(
            leading: Icon(Icons.people),
            title: Text(
              "Emergency Contacts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text("Mother"),
            subtitle: const Text("+880 1XXXXXXXXX"),
            trailing: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
          ),

          const Divider(),

          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text("Brother"),
            subtitle: const Text("+880 1XXXXXXXXX"),
            trailing: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
          ),

        ],

      ),

    );

  }

}
