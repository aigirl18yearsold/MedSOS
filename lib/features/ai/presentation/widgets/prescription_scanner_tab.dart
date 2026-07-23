import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionScannerTab extends StatefulWidget {
  const PrescriptionScannerTab({super.key});

  @override
  State<PrescriptionScannerTab> createState() =>
      _PrescriptionScannerTabState();
}

class _PrescriptionScannerTabState
    extends State<PrescriptionScannerTab> {

  File? image;

  String extractedText = "";

  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {

    final picked = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (picked == null) return;

    setState(() {
      image = File(picked.path);
    });

    scanPrescription();
  }

  Future<void> scanPrescription() async {

    // TODO:
    // Use Google ML Kit OCR

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {

      extractedText =

"""
Paracetamol 500 mg
Vitamin D
Take twice daily
After meals
""";

    });

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(16),

      child: Column(

        children: [

          if (image != null)

            ClipRRect(

              borderRadius: BorderRadius.circular(16),

              child: Image.file(
                image!,
                height: 220,
              ),

            )

          else

            Container(

              height: 220,

              decoration: BoxDecoration(

                borderRadius:
                    BorderRadius.circular(16),

                color: Colors.grey.shade200,

              ),

              child: const Center(

                child: Icon(
                  Icons.document_scanner,
                  size: 80,
                ),

              ),

            ),

          const SizedBox(height:20),

          Row(

            children: [

              Expanded(

                child: FilledButton.icon(

                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },

                  icon: const Icon(Icons.camera_alt),

                  label: const Text("Camera"),

                ),

              ),

              const SizedBox(width:10),

              Expanded(

                child: FilledButton.icon(

                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },

                  icon: const Icon(Icons.photo),

                  label: const Text("Gallery"),

                ),

              ),

            ],

          ),

          const SizedBox(height:25),

          Card(

            child: Padding(

              padding: const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Extracted Text",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height:10),

                  Text(extractedText),

                ],

              ),

            ),

          ),

          const SizedBox(height:20),

          SizedBox(

            width: double.infinity,

            child: FilledButton(

              onPressed: () {

                // Add medicines automatically

              },

              child: const Text(
                "Add Medicines",
              ),

            ),

          ),

        ],

      ),

    );

  }

}
