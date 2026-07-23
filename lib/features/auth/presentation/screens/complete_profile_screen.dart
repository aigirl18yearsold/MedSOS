import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState
    extends State<CompleteProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  String gender = "Male";

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void saveProfile() {

    if (!_formKey.currentState!.validate()) return;

    // TODO:
    // Save profile to Firestore

    Navigator.pushNamedAndRemoveUntil(
      context,
      "/home",
      (route) => false,
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Complete Profile"),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value!.isEmpty
                          ? "Enter your name"
                          : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    prefixIcon: Icon(Icons.cake),
                  ),
                  validator: (value) =>
                      value!.isEmpty
                          ? "Enter your age"
                          : null,
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(

                  value: gender,

                  decoration: const InputDecoration(
                    labelText: "Gender",
                    prefixIcon: Icon(Icons.people),
                  ),

                  items: const [

                    DropdownMenuItem(
                      value: "Male",
                      child: Text("Male"),
                    ),

                    DropdownMenuItem(
                      value: "Female",
                      child: Text("Female"),
                    ),

                    DropdownMenuItem(
                      value: "Other",
                      child: Text("Other"),
                    ),

                  ],

                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },

                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(

                  width: double.infinity,
                  height: 55,

                  child: FilledButton(

                    onPressed: saveProfile,

                    child:
