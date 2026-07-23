import 'package:flutter/material.dart';

class EmergencySOSScreen extends StatelessWidget {
  const EmergencySOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),

      appBar: AppBar(
        title: const Text("Emergency SOS"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              const Text(
                "Need Help?",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Press and hold the SOS button for 3 seconds.",
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              GestureDetector(
                onLongPress: () {
                  // Trigger Emergency
                },

                child: Container(
                  width: 220,
                  height: 220,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(.4),
                        blurRadius: 35,
                        spreadRadius: 12,
                      ),
                    ],
                  ),

                  child: const Center(
                    child: Text(
                      "SOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text("Current Location"),
                  subtitle: const Text(
                    "Location will appear here",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {},
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Emergency Contacts"),
                  subtitle: const Text("0 Contacts Added"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
