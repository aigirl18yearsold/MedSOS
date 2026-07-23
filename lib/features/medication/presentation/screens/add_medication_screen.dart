import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() =>
      _AddMedicationScreenState();
}

class _AddMedicationScreenState
    extends State<AddMedicationScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController dosageController =
      TextEditingController();

  final TextEditingController notesController =
      TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  String selectedCategory = "Tablet";

  final List<String> categories = [
    "Tablet",
    "Capsule",
    "Syrup",
    "Injection",
    "Drops",
    "Inhaler",
    "Other"
  ];

  Future<void> pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Medication"),
      ),

      body: Form(

        key: _formKey,

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Medication Name",
                prefixIcon: Icon(Icons.medication),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Required" : null,
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

            TextFormField(
              controller: dosageController,
              decoration: const InputDecoration(
                labelText: "Dosage",
                hintText: "e.g. 500 mg",
              ),
            ),

            const SizedBox(height: 20),

            ListTile(

              leading: const Icon(Icons.schedule),

              title: Text(
                selectedTime.format(context),
              ),

              trailing: ElevatedButton(
                onPressed: pickTime,
                child: const Text("Select Time"),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(

              controller: notesController,

              maxLines: 4,

              decoration: const InputDecoration(
                labelText: "Notes",
                hintText:
                    "Take after meals...",
              ),

            ),

            const SizedBox(height: 40),

            SizedBox(

              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  if (_formKey.currentState!.validate()) {

                    // Save Medication

                  }

                },

                child: const Text(
                  "Save Medication",
                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
