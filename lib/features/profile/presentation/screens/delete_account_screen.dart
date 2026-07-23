import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() =>
      _DeleteAccountScreenState();
}

class _DeleteAccountScreenState
    extends State<DeleteAccountScreen> {

  bool confirmDelete = false;
  bool loading = false;

  Future<void> deleteAccount() async {

    if (!confirmDelete) return;

    setState(() {
      loading = true;
    });

    try {

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.delete();
      }

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );
      }

    } catch (e) {

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }

    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Delete Account"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.delete_forever,
              size: 90,
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            const Text(
              "Delete Your Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "This action is permanent. Your account and associated data may be permanently deleted and cannot be recovered.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            CheckboxListTile(
              value: confirmDelete,
              title: const Text(
                "I understand that this action cannot be undone."
              ),
              onChanged: (value) {
                setState(() {
                  confirmDelete = value!;
                });
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed:
                    loading ? null : deleteAccount,
               
