import 'package:flutter/material.dart';

class EmergencySirenScreen extends StatefulWidget {
  const EmergencySirenScreen({super.key});

  @override
  State<EmergencySirenScreen> createState() =>
      _EmergencySirenScreenState();
}

class _EmergencySirenScreenState
    extends State<EmergencySirenScreen> {

  bool isPlaying = false;

  Future<void> startSiren() async {

    setState(() {
      isPlaying = true;
    });

    // TODO:
    // Play siren audio in loop

  }

  Future<void> stopSiren() async {

    setState(() {
      isPlaying = false;
    });

    // TODO:
    // Stop siren

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Emergency Siren"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              Icons.campaign,
              size: 140,
              color: isPlaying
                  ? Colors.red
                  : Colors.grey,
            ),

            const SizedBox(height: 30),

            Text(
              isPlaying
                  ? "Emergency Siren Active"
                  : "Emergency Siren Off",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                onPressed: isPlaying
                    ? stopSiren
                    : startSiren,
                icon: Icon(
                  isPlaying
                      ? Icons.stop
                      : Icons.volume_up,
                ),
                label: Text(
                  isPlaying
                      ? "Stop Siren"
                      : "Start Siren",
                ),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
