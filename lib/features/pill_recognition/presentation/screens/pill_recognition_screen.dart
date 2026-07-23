import 'package:flutter/material.dart';

class PillRecognitionScreen extends StatefulWidget {
  const PillRecognitionScreen({super.key});

  @override
  State<PillRecognitionScreen> createState() =>
      _PillRecognitionScreenState();
}

class _PillRecognitionScreenState
    extends State<PillRecognitionScreen> {

  bool isScanning = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("AI Pill Recognition"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Expanded(

              child: Container(

                width: double.infinity,

                decoration: BoxDecoration(

                  borderRadius:
                      BorderRadius.circular(20),

                  border: Border.all(
                    color: Colors.blue,
                  ),

                ),

                child: const Center(

                  child: Column(

                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Icon(
                        Icons.camera_alt,
                        size: 90,
                        color: Colors.blue,
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Take a clear picture of your medicine",
                        textAlign: TextAlign.center,
                      ),

                    ],

                  ),

                ),

              ),

            ),

            const SizedBox(height: 20),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton.icon(

                onPressed: () {
                  // Camera
                },

                icon: const Icon(Icons.camera),

                label: const Text(
                  "Open Camera",
                ),

              ),

            ),

            const SizedBox(height: 15),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: OutlinedButton.icon(

                onPressed: () {
                  // Gallery
                },

                icon: const Icon(Icons.photo),

                label: const Text(
                  "Choose from Gallery",
                ),

              ),

            ),

            const SizedBox(height: 15),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: FilledButton(

                onPressed: () {

                  setState(() {

                    isScanning = true;

                  });

                  // AI Recognition

                },

                child: Text(

                  isScanning
                      ? "Scanning..."
                      : "Identify Medicine",

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
