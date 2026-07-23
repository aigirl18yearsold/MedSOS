import 'package:flutter/material.dart';

class FlashlightSOSScreen extends StatefulWidget {
  const FlashlightSOSScreen({super.key});

  @override
  State<FlashlightSOSScreen> createState() =>
      _FlashlightSOSScreenState();
}

class _FlashlightSOSScreenState
    extends State<FlashlightSOSScreen> {

  bool isRunning = false;

  Future<void> startSOS() async {

    setState(() {
      isRunning = true;
    });

    // TODO:
    // Turn flashlight ON
    // Blink Morse Code:
    // ... --- ...
    // Repeat until stopped

  }

  Future<void> stopSOS() async {

    setState(() {
      isRunning = false;
    });

    // TODO:
    // Turn flashlight OFF

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Flashlight SOS"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              Icons.flashlight_on,
              size: 140,
              color: isRunning
                  ? Colors.amber
                  : Colors.grey,
            ),

            const SizedBox(height: 30),

            Text(
              isRunning
                  ? "SOS Flashlight Active"
                  : "Flashlight is Off",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton.icon(
                onPressed: isRunning
                    ? stopSOS
                    : startSOS,
                icon: Icon(
                  isRunning
                      ? Icons.stop
                      : Icons.flashlight_on,
                ),
                label: Text(
                  isRunning
                      ? "Stop SOS"
                      : "Start SOS",
                ),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
