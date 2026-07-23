import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {

  bool medicationReminder = true;
  bool emergencyAlerts = true;
  bool refillReminder = true;
  bool appointmentReminder = true;
  bool healthTips = false;
  bool sound = true;
  bool vibration = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notification Settings"),
      ),

      body: ListView(

        children: [

          SwitchListTile(
            title: const Text("Medication Reminders"),
            subtitle: const Text(
              "Receive medicine reminders",
            ),
            value: medicationReminder,
            onChanged: (value) {
              setState(() {
                medicationReminder = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Emergency Alerts"),
            value: emergencyAlerts,
            onChanged: (value) {
              setState(() {
                emergencyAlerts = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Refill Reminders"),
            value: refillReminder,
            onChanged: (value) {
              setState(() {
                refillReminder = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Appointment Reminders"),
            value: appointmentReminder,
            onChanged: (value) {
              setState(() {
                appointmentReminder = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Health Tips"),
            value: healthTips,
            onChanged: (value) {
              setState(() {
                healthTips = value;
              });
            },
          ),

          const Divider(),

          SwitchListTile(
            title: const Text("Sound"),
            value: sound,
            onChanged: (value) {
              setState(() {
                sound = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Vibration"),
            value: vibration,
            onChanged: (value) {
              setState(() {
                vibration = value;
              });
            },
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Save settings
                },
                child: const Text("Save"),
              ),
            ),
          ),

        ],

      ),

    );

  }

}
