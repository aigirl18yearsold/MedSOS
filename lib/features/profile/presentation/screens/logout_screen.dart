import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  Future<void> logout(BuildContext context) async {

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {

        return AlertDialog(

          title: const Text("Sign Out"),

          content: const Text(
            "Are you sure you want to sign out?"
          ),

          actions: [

            TextButton(
              onPressed: (){
                Navigator.pop(context,false);
              },
              child: const Text("Cancel"),
            ),

            FilledButton(
              onPressed: (){
                Navigator.pop(context,true);
              },
              child: const Text("Sign Out"),
            ),

          ],

        );

      },
    );

    if(confirm != true) return;

    await FirebaseAuth.instance.signOut();

    if(context.mounted){

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/login",
        (route)=>false,
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Logout"),
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.logout,
                size: 90,
                color: Colors.red,
              ),

              const SizedBox(height:20),

              const Text(
                "Sign Out of MedSOS",
                style: TextStyle(
                  fontSize:24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:15),

              const Text(
                "You can sign in again anytime using your account.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height:40),

              SizedBox(
                width: double.infinity,
                height:55,
                child: FilledButton.icon(

                  icon: const Icon(Icons.logout),

                  label: const Text("Sign Out"),

                  onPressed: (){
                    logout(context);
                  },

                ),
              ),

            ],

          ),

        ),

      ),

    );

  }

}
