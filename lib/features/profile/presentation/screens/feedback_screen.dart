import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  double rating = 5;

  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Feedback"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Rate Your Experience",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                rating.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Slider(
              value: rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: rating.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: feedbackController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: "Your Feedback",
                hintText:
                    "Tell us how we can improve MedSOS...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {

                  // Submit Feedback

                },
                child: const Text("Submit Feedback"),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
