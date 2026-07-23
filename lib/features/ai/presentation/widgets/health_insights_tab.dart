import 'package:flutter/material.dart';

class HealthInsightsTab extends StatelessWidget {
  const HealthInsightsTab({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(16),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Card(

            child: Padding(

              padding: const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: const [

                  Row(

                    children: [

                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),

                      SizedBox(width:10),

                      Text(
                        "Health Score",
                        style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],

                  ),

                  SizedBox(height:20),

                  LinearProgressIndicator(
                    value: .91,
                    minHeight: 12,
                  ),

                  SizedBox(height:10),

                  Text(
                    "91 / 100",
                    style: TextStyle(
                      fontSize:28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],

              ),

            ),

          ),

          const SizedBox(height:20),

          const Text(
            "Today's Insights",
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:10),

          Card(

            child: Column(

              children: const [

                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text(
                    "You haven't missed any medication today."
                  ),
                ),

                Divider(),

                ListTile(
                  leading: Icon(
                    Icons.water_drop,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Drink more water today."
                  ),
                ),

                Divider(),

                ListTile(
                  leading: Icon(
                    Icons.directions_walk,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Take a short walk for 20 minutes."
                  ),
                ),

              ],

            ),

          ),

          const SizedBox(height:20),

          const Text(
            "Medication Adherence",
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:10),

          Card(

            child: Padding(

              padding: const EdgeInsets.all(16),

              child: Column(

                children: const [

                  ListTile(
                    title: Text("This Week"),
                    trailing: Text("94%"),
                  ),

                  ListTile(
                    title: Text("This Month"),
                    trailing: Text("91%"),
                  ),

                  ListTile(
                    title: Text("Current Streak"),
                    trailing: Text("8 Days"),
                  ),

                ],

              ),

            ),

          ),

          const SizedBox(height:20),

          Card(

            color: Colors.blue.shade50,

            child: const Padding(

              padding: EdgeInsets.all(16),

              child: Column(

                children: [

                  Text(
                    "AI Recommendation",
                    style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height:15),

                  Text(
                    "Great job maintaining your medication schedule. Continue following your doctor's instructions and remember to stay hydrated. These insights are informational and are not medical advice.",
                    textAlign: TextAlign.center,
                  ),

                ],

              ),

            ),

          ),

        ],

      ),

    );

  }

}
