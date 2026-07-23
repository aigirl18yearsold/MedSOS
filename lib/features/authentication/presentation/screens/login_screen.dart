import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height:40),

              Center(
                child: CircleAvatar(
                  radius:55,
                  child: Icon(
                    Icons.medical_services,
                    size:55,
                  ),
                ),
              ),

              const SizedBox(height:35),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize:32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:8),

              const Text(
                "Sign in to continue using MedSOS.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize:16,
                ),
              ),

              const SizedBox(height:35),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height:20),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: (){
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height:10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    // Navigate to Forgot Password
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height:10),

              SizedBox(
                width: double.infinity,
                height:55,
                child: ElevatedButton(
                  onPressed: (){
                    // Backend Login
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize:18),
                  ),
                ),
              ),

              const SizedBox(height:25),

              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:12),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height:25),

              OutlinedButton.icon(
                onPressed: (){
                  // Google Sign-In
                },
                icon: const Icon(Icons.g_mobiledata),
                label: const Text("Continue with Google"),
              ),

              const SizedBox(height:35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text("Don't have an account?"),

                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text("Sign Up"),
                  )

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
