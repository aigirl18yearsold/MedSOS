import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Row(

              children: [

                Icon(Icons.calendar_today),

                SizedBox(width:10),

                Text(
                  "Upcoming Appointment",
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],

            ),

            const SizedBox(height:20),

            ListTile(

              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),

              title: const Text("Dr. Sarah Ahmed"),

              subtitle: const Text(
                "Cardiologist\nTomorrow • 10:30 AM",
              ),

              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),

            ),

          ],

        ),

      ),

    );

  }

}
