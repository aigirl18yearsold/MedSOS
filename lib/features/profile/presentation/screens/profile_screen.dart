import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const SizedBox(height: 20),

          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage("assets/images/profile.png"),
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "John Doe",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              "john@email.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 35),

          buildTile(
            Icons.person,
            "Edit Profile",
            () {},
          ),

          buildTile(
            Icons.medical_information,
            "Medical ID",
            () {},
          ),

          buildTile(
            Icons.notifications,
            "Notifications",
            () {},
          ),

          buildTile(
            Icons.lock,
            "Privacy & Security",
            () {},
          ),

          buildTile(
            Icons.settings,
            "Settings",
            () {},
          ),

          buildTile(
            Icons.help,
            "Help Center",
            () {},
          ),

          buildTile(
            Icons.logout,
            "Logout",
            () {},
          ),

        ],
      ),
    );
  }

  Widget buildTile(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return Card(

      margin: const EdgeInsets.only(bottom: 14),

      child: ListTile(

        leading: Icon(icon),

        title: Text(title),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: onTap,

      ),

    );

  }
}
