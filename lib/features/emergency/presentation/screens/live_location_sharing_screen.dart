import 'package:flutter/material.dart';

class LiveLocationSharingScreen extends StatefulWidget {
  const LiveLocationSharingScreen({super.key});

  @override
  State<LiveLocationSharingScreen> createState() =>
      _LiveLocationSharingScreenState();
}

class _LiveLocationSharingScreenState
    extends State<LiveLocationSharingScreen> {

  bool sharing = false;

  String lastUpdated = "--";

  String latitude = "23.8103";
  String longitude = "90.4125";

  Future<void> startSharing() async {

    setState(() {
      sharing = true;
      lastUpdated = TimeOfDay.now().format(context);
    });

    // TODO:
    // Start GPS Stream
    // Upload to Firebase
    // Share with Emergency Contacts

  }

  Future<void> stopSharing() async {

    setState(() {
      sharing = false;
    });

    // TODO:
    // Stop GPS Stream

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Live Location Sharing"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            Icon(
              Icons.location_history,
              size: 120,
              color:
                  sharing ? Colors.green : Colors.grey,
            ),

            const SizedBox(height: 20),

            Text(
              sharing
                  ? "Live Sharing Enabled"
                  : "Not Sharing",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const
