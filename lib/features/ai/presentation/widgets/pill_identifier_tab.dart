import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PillIdentifierTab extends StatefulWidget {
  const PillIdentifierTab({super.key});

  @override
  State<PillIdentifierTab> createState() =>
      _PillIdentifierTabState();
}

class _PillIdentifierTabState
    extends State<PillIdentifierTab> {

  File? pillImage;

  final picker = ImagePicker();

  bool isLoading = false;

  Map<String, String>? result;

  Future<void> pickImage(ImageSource source) async {

    final picked = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (picked == null) return;

    setState(() {
      pillImage = File(picked.path);
      isLoading = true;
    });

    // TODO:
    // Send image to AI backend

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {

      isLoading = false;

      result = {
        "Medicine": "Paracetamol",
        "Strength": "500 mg",
        "Type": "Tablet",
        "Use": "Pain relief and fever reduction",
        "Confidence": "92%"
      };

    });

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(16),

      child: Column(

        children: [

          if (pillImage != null)

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                pillImage!,
                height: 220,
              ),
            )

          else

            Container(

              height: 220,

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: const Center(
                child: Icon(
                  Icons.medication,
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

          if (isLoading)
            const CircularProgressIndicator(),

          if (result != null)

            Card(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Identification Result",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Divider(),

                    Text(
                        "Medicine: ${result!["Medicine"]}"),

                    Text(
                        "Strength: ${result!["Strength"]}"),

                    Text(
                        "Type: ${result!["Type"]}"),

                    Text(
                        "Use: ${result!["Use"]}"),

                    Text(
                        "Confidence: ${result!["Confidence"]}"),

                    const SizedBox(height:16),

                    const Text(
                      "⚠️ AI identification may be incorrect. Always verify with the medicine packaging, a pharmacist, or your healthcare provider before taking any medication.",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),

                  ],

                ),

              ),

            ),

        ],

      ),

    );

  }

}
