import 'package:flutter/material.dart';

class PrescriptionScannerScreen extends StatelessWidget {
  const PrescriptionScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription Scanner"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              height: 250,
              width: double.infinity,

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.document_scanner,
                    size: 90,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "No Prescription Selected",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () {
                  // Open Camera
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Take Photo"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: OutlinedButton.icon(
                onPressed: () {
                  // Pick from Gallery
                },
                icon: const Icon(Icons.photo),
                label: const Text("Choose from Gallery"),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: FilledButton(
                onPressed: () {
                  // OCR Processing
                },
                child: const Text("Scan Prescription"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
