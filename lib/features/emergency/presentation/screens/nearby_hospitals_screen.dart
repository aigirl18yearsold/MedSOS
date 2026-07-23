import 'package:flutter/material.dart';

class NearbyHospitalsScreen extends StatelessWidget {
  const NearbyHospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Hospitals"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          HospitalCard(
            name: "City Medical Hospital",
            distance: "0.8 km",
            address: "Downtown",
          ),

          HospitalCard(
            name: "General Hospital",
            distance: "2.4 km",
            address: "Main Road",
          ),

          HospitalCard(
            name: "Emergency Care Center",
            distance: "4.2 km",
            address: "West Avenue",
          ),

        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String distance;
  final String address;

  const HospitalCard({
    super.key,
    required this.name,
    required this.distance,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(address),

            Text("Distance: $distance"),

            const SizedBox(height: 16),

            Row(

              children: [

                Expanded(

                  child: ElevatedButton.icon(

                    onPressed: () {
                      // Open Google Maps
                    },

                    icon: const Icon(Icons.navigation),

                    label: const Text("Navigate"),

                  ),

                ),

                const SizedBox(width: 12),

                Expanded(

                  child: OutlinedButton.icon(

                    onPressed: () {
                      // Call Hospital
                    },

                    icon: const Icon(Icons.call),

                    label: const Text("Call"),

                  ),

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}
