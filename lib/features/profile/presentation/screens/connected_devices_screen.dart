import 'package:flutter/material.dart';

class ConnectedDevicesScreen extends StatelessWidget {
  const ConnectedDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connected Devices"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          DeviceCard(
            deviceName: "Samsung Galaxy S24",
            location: "Rajshahi, Bangladesh",
            lastActive: "Active Now",
            currentDevice: true,
          ),

          DeviceCard(
            deviceName: "Windows Laptop",
            location: "Rajshahi, Bangladesh",
            lastActive: "Yesterday",
            currentDevice: false,
          ),

          DeviceCard(
            deviceName: "Chrome Browser",
            location: "Dhaka, Bangladesh",
            lastActive: "3 Days Ago",
            currentDevice: false,
          ),

        ],
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {

  final String deviceName;
  final String location;
  final String lastActive;
  final bool currentDevice;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.location,
    required this.lastActive,
    required this.currentDevice,
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

            Row(

              children: [

                const Icon(Icons.devices),

                const SizedBox(width: 10),

                Expanded(

                  child: Text(
                    deviceName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

                if(currentDevice)

                  const Chip(
                    label: Text("Current"),
                  ),

              ],

            ),

            const SizedBox(height: 10),

            Text("Location: $location"),

            Text("Last Active: $lastActive"),

            const SizedBox(height: 16),

            if(!currentDevice)

              SizedBox(

                width: double.infinity,

                child: OutlinedButton.icon(

                  onPressed: () {

                    // Remove Device

                  },

                  icon: const Icon(Icons.logout),

                  label: const Text(
                    "Sign Out Device",
                  ),

                ),

              ),

          ],

        ),

      ),

    );

  }

}
