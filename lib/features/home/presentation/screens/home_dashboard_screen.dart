import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("MedSOS"),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),

        ],

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: const [

            WelcomeCard(),

            SizedBox(height:16),

            SOSCard(),

            SizedBox(height:16),

            MedicationCard(),

            SizedBox(height:16),

            ReminderCard(),

            SizedBox(height:16),

            HealthSummaryCard(),

            SizedBox(height:16),

            AIAssistantCard(),

            SizedBox(height:16),

            AppointmentCard(),

            SizedBox(height:16),

            ProgressCard(),

            SizedBox(height:16),

            QuickActionsCard(),

          ],

        ),

      ),

    );

  }

}
