import 'dart:async';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends State<EmailVerificationScreen> {

  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            seconds--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.mark_email_read_rounded,
                size: 120,
                color: Colors.green,
              ),

              const SizedBox(height: 30),

              const Text(
                "Verify Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "We've sent a verification email. Please verify your account before continuing.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Check Email Verification
                  },
                  child: const Text(
                    "I've Verified My Email",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: seconds == 0
                    ? () {
                        setState(() {
                          seconds = 60;
                        });
                        startTimer();

                        // Resend Verification Email
                      }
                    : null,
                child: Text(
                  seconds == 0
                      ? "Resend Email"
                      : "Resend in ${seconds}s",
                ),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
