import 'package:flutter/material.dart';

class NearbyHospitalsCard extends StatelessWidget {
  const NearbyHospitalsCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        children: const [

          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text("Nearby Hospitals"),
          ),

          ListTile(
            title: Text("City General Hospital"),
            subtitle: Text("2.4 km away"),
          ),

          Divider(),

          ListTile(
            title: Text("Community Medical Center"),
            subtitle: Text("4.1 km away"),
          ),

        ],

      ),

    );

  }

}
