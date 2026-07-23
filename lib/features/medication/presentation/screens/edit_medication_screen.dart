import 'package:flutter/material.dart';

class EditMedicationScreen extends StatefulWidget {
  final String medicationName;
  final String dosage;
  final String category;
  final String notes;

  const EditMedicationScreen({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.category,
    required this.notes,
  });

  @override
  State<EditMedicationScreen> createState() =>
      _EditMedicationScreenState();
}

class _EditMedicationScreenState
    extends State<EditMedicationScreen> {

  late TextEditingController nameController;
  late TextEditingController dosageController;
  late TextEditingController notesController;

  late String selectedCategory;

  final List<String> categories = [
    "Tablet",
    "Capsule",
    "Syrup",
    "Injection",
    "Drops",
    "Inhaler",
    "Other",
  ];

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.medicationName);

    dosageController =
        TextEditingController(text: widget.dosage);

    notesController =
        TextEditingController(text: widget.notes);

    selectedCategory = widget.category;
  }

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Medication"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: ListView(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Medication Name",
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: "Category",
              ),
              items: categories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: dosageController,
              decoration: const InputDecoration(
                labelText: "Dosage",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Notes",
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Update Medication
                },
                child: const Text("Update Medication"),
              ),
            ),

          ],

        ),

      ),

    );

  }
}
