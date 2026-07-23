import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMedSOSScreen extends StatefulWidget {
  const AboutMedSOSScreen({super.key});

  @override
  State<AboutMedSOSScreen> createState() => _AboutMedSOSScreenState();
}

class _AboutMedSOSScreenState extends State<AboutMedSOSScreen> {

  String version = "Loading...";

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  Future<void> loadVersion() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      version = "${info.version} (${info.buildNumber})";
    });
  }

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("About MedSOS"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.local_hospital,
              size: 60,
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "MedSOS",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              "Your AI Healthcare Companion",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Version"),
              subtitle: Text(version),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("
