import 'package:flutter/material.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({super.key});

  @override
  State<ProfilePictureScreen> createState() =>
      _ProfilePictureScreenState();
}

class _ProfilePictureScreenState
    extends State<ProfilePictureScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile Picture"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          children: [

            const SizedBox(height: 30),

            const CircleAvatar(
              radius: 80,
              child: Icon(
                Icons.person,
                size: 90,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text("Take Photo"),
                onPressed: () {
                  // Open Camera
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.photo_library),
                label: const Text("Choose from Gallery"),
                onPressed: () {
                  // Open Gallery
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Remove Photo"),
                onPressed: () {
                  // Delete Image
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  // Upload Image
                },
                child: const Text("Save"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
