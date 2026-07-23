import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          const SizedBox(height: 10),

          const CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 55,
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              "John Doe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              "john@example.com",
            ),
          ),

          const SizedBox(height: 25),

          Card(

            child: Column(

              children: [

                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit Profile"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Medical Information"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Emergency Contacts"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

              ],

            ),

          ),

          const SizedBox(height: 20),

          Card(

            child: Column(

              children: [

                SwitchListTile(
                  value: false,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.notifications),
                  title: const Text("Notifications"),
                ),

                const Divider(height: 1),

                SwitchListTile(
                  value: false,
                  onChanged: (value) {},
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text("Dark Mode"),
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Language"),
                  subtitle: const Text("English"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

              ],

            ),

          ),

          const SizedBox(height: 20),

          Card(

            child: Column(

              children: [

                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Privacy & Security"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text("Help & Support"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("About MedSOS"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

              ],

            ),

          ),

          const SizedBox(height: 25),

          FilledButton.icon(

            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(
                double.infinity,
                55,
              ),
            ),

            onPressed: () {

              // Logout

            },

            icon: const Icon(Icons.logout),

            label: const Text("Logout"),

          ),

          const SizedBox(height: 30),

        ],

      ),

    );

  }

}
