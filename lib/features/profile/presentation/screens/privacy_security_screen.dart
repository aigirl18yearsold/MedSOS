import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() =>
      _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState
    extends State<PrivacySecurityScreen> {

  bool biometric = false;
  bool locationSharing = true;
  bool analytics = false;
  bool crashReports = true;
  bool emergencyAccess = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Privacy & Security"),
      ),

      body: ListView(

        children: [

          const SizedBox(height: 10),

          const ListTile(
            title: Text(
              "Security",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SwitchListTile(
            title: const Text("Biometric Login"),
            subtitle: const Text(
              "Use fingerprint or face unlock",
            ),
            value: biometric,
            onChanged: (value) {
              setState(() {
                biometric = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Emergency Location Sharing"),
            subtitle: const Text(
              "Share location only during SOS",
            ),
            value: locationSharing,
            onChanged: (value) {
              setState(() {
                locationSharing = value;
              });
            },
          ),

          const Divider(),

          const ListTile(
            title: Text(
              "Privacy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SwitchListTile(
            title: const Text("Share Anonymous Analytics"),
            value: analytics,
            onChanged: (value) {
              setState(() {
                analytics = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Crash Reports"),
            value: crashReports,
            onChanged: (value) {
              setState(() {
                crashReports = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text("Emergency Medical Access"),
            subtitle: const Text(
              "Allow emergency medical information on lock screen",
            ),
            value: emergencyAccess,
            onChanged: (value) {
              setState(() {
                emergencyAccess = value;
              });
            },
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FilledButton(
              onPressed: () {
                //
