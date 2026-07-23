import 'package:flutter/material.dart';

class RegisterTab extends StatelessWidget {

  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(20),

      child: SingleChildScrollView(

        child: Column(

          children: [

            TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height:20),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),

            SizedBox(height:20),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height:20),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),

            SizedBox(height:30),

            SizedBox(
              width: double.infinity,
              height:55,
              child: FilledButton(
                onPressed: (){},
                child: Text("Create Account"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
