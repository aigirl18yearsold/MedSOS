import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = "John Doe";
    emailController.text = "john@email.com";
    phoneController.text = "+8801700000000";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: Form(

        key: _formKey,

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const Center(
              child: CircleAvatar(
                radius: 55,
                child: Icon(Icons.person,size:60),
              ),
            ),

            TextButton.icon(
              onPressed: () {
                // Pick Image
              },
              icon: const Icon(Icons.photo_camera),
              label: const Text("Change Photo"),
            ),

            const SizedBox(height:20),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height:15),

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height:15),

            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            const SizedBox(height:15),

            TextFormField(
              controller: dobController,
              decoration: const InputDecoration(
                labelText: "Date of Birth",
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),

            const SizedBox(height:15),

            TextFormField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: "Gender",
                prefixIcon: Icon(Icons.people),
              ),
            ),

            const SizedBox(height:15),

            TextFormField(
              controller: addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Address",
                prefixIcon: Icon(Icons.location_on),
              ),
            ),

            const SizedBox(height:30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    // Save Profile
                  }
                },
                child: const Text("Save Changes"),
              ),
            ),

          ],

       
