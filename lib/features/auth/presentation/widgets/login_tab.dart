import 'package:flutter/material.dart';

class LoginTab extends StatelessWidget {

  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(20),

      child: Column(

        children: [

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

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  "/forgot-password",
                );
              },
              child: Text("Forgot Password?"),
            ),
          ),

          SizedBox(height:20),

          SizedBox(
            width: double.infinity,
            height:55,
            child: FilledButton(
              onPressed: (){},
              child: Text("Login"),
            ),
          ),

        ],

      ),

    );

  }

}
