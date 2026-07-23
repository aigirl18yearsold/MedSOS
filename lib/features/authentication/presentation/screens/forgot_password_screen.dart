import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height:20),

              const Text(

                "Forgot Password?",

                style: TextStyle(

                  fontSize:32,

                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height:10),

              const Text(

                "Enter your registered email address and we'll send you instructions to reset your password.",

                style: TextStyle(

                  color: Colors.grey,

                  fontSize:16,

                ),

              ),

              const SizedBox(height:35),

              TextField(

                controller: emailController,

                keyboardType:
                    TextInputType.emailAddress,

                decoration: const InputDecoration(

                  labelText: "Email",

                  prefixIcon:
                      Icon(Icons.email_outlined),

                ),

              ),

              const SizedBox(height:35),

              SizedBox(

                width: double.infinity,

                height:55,

                child: ElevatedButton(

                  onPressed: (){

                    // Firebase Reset Password

                  },

                  child: const Text(

                    "Send Reset Link",

                    style: TextStyle(fontSize:18),

                  ),

                ),

              ),

              const SizedBox(height:25),

              Center(

                child: TextButton(

                  onPressed: (){

                    Navigator.pop(context);

                  },

                  child: const Text(

                    "Back to Login",

                  ),

                ),

              )

            ],

          ),

        ),

      ),

    );

  }

}
