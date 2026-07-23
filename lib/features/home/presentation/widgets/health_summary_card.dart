import 'package:flutter/material.dart';

class HealthSummaryCard extends StatelessWidget {

  const HealthSummaryCard({super.key});

  Widget buildItem(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {

    return Expanded(

      child: Card(

        elevation: 0,

        child: Padding(

          padding: const EdgeInsets.all(15),

          child: Column(

            children: [

              Icon(
                icon,
                color: color,
                size: 30,
              ),

              const SizedBox(height:10),

              Text(
                value,
                style: const TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:5),

              Text(
                title,
                textAlign: TextAlign.center,
              ),

            ],

          ),

        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const Text(
          "Health Summary",
          style: TextStyle(
            fontSize:22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height:15),

        Row(

          children: [

            buildItem(
              "Taken",
              "12",
              Icons.check_circle,
              Colors.green,
            ),

            const SizedBox(width:10),

            buildItem(
              "Missed",
              "2",
              Icons.cancel,
              Colors.red,
            ),

          ],

        ),

        const SizedBox(height:10),

        Row(

          children: [

            buildItem(
              "Streak",
              "8 Days",
              Icons.local_fire_department,
              Colors.orange,
            ),

            const SizedBox(width:10),

            buildItem(
              "Adherence",
              "92%",
              Icons.favorite,
              Colors.pink,
            ),

          ],

        ),

      ],

    );

  }

}
