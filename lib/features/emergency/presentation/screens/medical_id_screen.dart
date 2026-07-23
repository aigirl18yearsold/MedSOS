import 'package:flutter/material.dart';

class MedicalIDScreen extends StatefulWidget {
  const MedicalIDScreen({super.key});

  @override
  State<MedicalIDScreen> createState() => _MedicalIDScreenState();
}

class _MedicalIDScreenState extends State<MedicalIDScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final allergiesController = TextEditingController();
  final conditionsController = TextEditingController();
  final medicationsController = TextEditingController();
  final emergencyContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Medical ID"),
      ),

      body: Form(

        key: _formKey,

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                prefixIcon: Icon(Icons.cake),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: bloodGroupController,
              decoration: const InputDecoration(
                labelText: "Blood Group",
                prefixIcon: Icon(Icons.bloodtype),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: allergiesController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Allergies",
                prefixIcon: Icon(Icons.warning),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: conditionsController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Medical Conditions",
                prefixIcon: Icon(Icons.local_hospital),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: medicationsController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Current Medications",
                prefixIcon: Icon(Icons.medication),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: emergencyContactController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Emergency Contact",
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save Medical ID
                  }
                },
                child: const Text("Save Medical ID"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
