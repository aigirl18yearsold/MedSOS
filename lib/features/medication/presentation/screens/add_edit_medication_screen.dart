import 'package:flutter/material.dart';

class AddEditMedicationScreen extends StatefulWidget {
  final bool isEditing;

  const AddEditMedicationScreen({
    super.key,
    this.isEditing = false,
  });

  @override
  State<AddEditMedicationScreen> createState() =>
      _AddEditMedicationScreenState();
}

class _AddEditMedicationScreenState
    extends State<AddEditMedicationScreen> {

  final _formKey = GlobalKey<FormState>();

  final medicineController = TextEditingController();
  final dosageController = TextEditingController();
  final noteController = TextEditingController();

  String frequency = "Once Daily";

  TimeOfDay selectedTime = TimeOfDay.now();

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
  void dispose() {
    medicineController.dispose();
    dosageController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void saveMedication() {

    if (!_formKey.currentState!.validate()) return;

    // TODO:
    // Save to Firebase

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.isEditing
              ? "Edit Medication"
              : "Add Medication",
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              TextFormField(
                controller: medicineController,
                decoration: const InputDecoration(
                  labelText: "Medicine Name",
                  prefixIcon: Icon(Icons.medication),
                ),
                validator: (v) =>
                    v!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height:20),

              TextFormField(
                controller: dosageController,
                decoration: const InputDecoration(
                  labelText: "Dosage",
                  prefixIcon: Icon(Icons.medical_information),
                ),
              ),

              const SizedBox(height:20),

              DropdownButtonFormField(

                value: frequency,

                decoration: const InputDecoration(
                  labelText: "Frequency",
                ),

                items: const [

                  DropdownMenuItem(
                    value: "Once Daily",
                    child: Text("Once Daily"),
                  ),

                  DropdownMenuItem(
                    value: "Twice Daily",
                    child: Text("Twice Daily"),
                  ),

                  DropdownMenuItem(
                    value: "Three Times Daily",
                    child: Text("Three Times Daily"),
                  ),

                  DropdownMenuItem(
                    value: "Weekly",
                    child: Text("Weekly"),
                  ),

                ],

                onChanged: (value) {
                  setState(() {
                    frequency = value!;
                  });
                },

              ),

              const SizedBox(height:20),

              ListTile(

                leading: const Icon(Icons.access_time),

                title: const Text("Reminder Time"),

                subtitle: Text(
                  selectedTime.format(context),
                ),

                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: pickTime,
                ),

              ),

              const SizedBox(height:20),

              TextField(
                controller: noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Notes",
                  prefixIcon: Icon(Icons.note),
                ),
              ),

              const SizedBox(height:30),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: FilledButton(

                  onPressed: saveMedication,

                  child: Text(
                    widget.isEditing
                        ? "Update Medication"
                        : "Save Medication",
                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
