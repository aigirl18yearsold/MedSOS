import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  bool loading = false;

  Future<void> resetPassword() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      loading = true;
    });

    try {

      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password reset email sent successfully.",
          ),
        ),
      );

      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {

      String message = "Something went wrong.";

      if (e.code == "user-not-found") {
        message = "No account found with this email.";
      }

      if (e.code == "invalid-email") {
        message = "Please enter a valid email.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }

  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Form(

          key: _formKey,

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.lock_reset,
                size: 80,
              ),

              const SizedBox(height: 20),

              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter your email address and we'll send you a password reset link.",
              ),

              const SizedBox(height: 30),

              TextFormField(

                controller: emailController,

                keyboardType:
                    TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),

                validator: (value) {

                  if (value == null ||
                      value.trim().isEmpty) {
                    return "Email is required";
                  }

                  if (!value.contains("@")) {
                    return "Invalid email";
                  }

                  return null;
                },

              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: FilledButton(

                  onPressed:
                      loading ? null : resetPassword,

                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Send Reset Link",
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
