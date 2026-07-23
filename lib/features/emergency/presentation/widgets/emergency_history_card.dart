import 'package:flutter/material.dart';

class EmergencyHistoryCard extends StatelessWidget {
  const EmergencyHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        children: const [

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Recent SOS Activity"),
          ),

          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text("SOS sent successfully"),
            subtitle: Text("12 July • 3:45 PM"),
          ),

        ],

      ),

    );

  }

}
