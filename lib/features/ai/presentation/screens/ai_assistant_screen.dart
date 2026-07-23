import 'package:flutter/material.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() =>
      _AIAssistantScreenState();
}

class _AIAssistantScreenState
    extends State<AIAssistantScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("AI Health Assistant"),

        actions: [

          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Show AI History Bottom Sheet
            },
          ),

        ],

        bottom: TabBar(

          controller: tabController,

          isScrollable: true,

          tabs: const [

            Tab(
              icon: Icon(Icons.chat),
              text: "Chat",
            ),

            Tab(
              icon: Icon(Icons.document_scanner),
              text: "Prescription",
            ),

            Tab(
              icon: Icon(Icons.medication),
              text: "Pill",
            ),

            Tab(
              icon: Icon(Icons.insights),
              text: "Insights",
            ),

          ],

        ),

      ),

      body: TabBarView(

        controller: tabController,

        children: const [

          AIChatTab(),

          PrescriptionScannerTab(),

          PillIdentifierTab(),

          HealthInsightsTab(),

        ],

      ),

    );

  }

}
