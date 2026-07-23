import 'package:flutter/material.dart';

class EmergencyCenterScreen extends StatelessWidget {
  const EmergencyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Emergency Center"),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/add-contact");
        },
        icon: const Icon(Icons.person_add),
        label: const Text("Add Contact"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: const [

          SOSButtonCard(),

          SizedBox(height:16),

          EmergencyContactsCard(),

          SizedBox(height:16),

          LiveLocationCard(),

          SizedBox(height:16),

          NearbyHospitalsCard(),

          SizedBox(height:16),

          EmergencyHistoryCard(),

        ],

      ),

    );

  }

}
