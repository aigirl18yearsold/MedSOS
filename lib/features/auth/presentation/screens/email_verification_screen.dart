import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends State<EmailVerificationScreen> {

  bool isVerified = false;
  bool canResend = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    isVerified = user?.emailVerified ?? false;

    if (!isVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 5),
        (_) => checkVerification(),
      );
    }
  }

  Future<void> sendVerificationEmail() async {

    final user = FirebaseAuth.instance.currentUser;

    await user?.sendEmailVerification();

    setState(() {
      canResend = false;
    });

    await Future.delayed(
      const Duration(seconds: 60),
    );

    if (mounted) {
      setState(() {
        canResend = true;
      });
    }
  }

  Future<void> checkVerification() async {

    await FirebaseAuth.instance.currentUser?.reload();

    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.emailVerified) {

      timer?.cancel();

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        "/complete-profile",
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Verify Email"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.mark_email_read,
              size: 90,
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            const Text(
              "Verify Your Email",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              FirebaseAuth.instance.currentUser?.email ??
                  "",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              "We've sent a verification email. Please verify your email address before continuing.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: canResend
                    ? sendVerificationEmail
                    : null,
                child: const Text(
                  "Resend Verification Email",
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextButton(

              onPressed: () async {

                await FirebaseAuth.instance.signOut();

                if (!mounted) return;

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (route) => false,
                );

              },

              child: const Text(
                "Cancel",
              ),

            ),

          ],

        ),

      ),

    );

  }

}
