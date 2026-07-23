import 'package:flutter/material.dart';

class VoiceAssistantScreen extends StatefulWidget {
  const VoiceAssistantScreen({super.key});

  @override
  State<VoiceAssistantScreen> createState() =>
      _VoiceAssistantScreenState();
}

class _VoiceAssistantScreenState
    extends State<VoiceAssistantScreen> {

  bool listening = false;

  String recognizedText =
      "Press the microphone to start speaking.";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("AI Voice Assistant"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            AnimatedContainer(
              duration:
                  const Duration(milliseconds: 300),

              width: listening ? 180 : 140,
              height: listening ? 180 : 140,

              decoration: BoxDecoration(
                color: listening
                    ? Colors.red
                    : Colors.blue,
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.mic,
                color: Colors.white,
                size: 70,
              ),
            ),

            const SizedBox(height: 40),

            Text(
              recognizedText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    listening = !listening;

                    if (listening) {
                      recognizedText =
                          "Listening...";
                    } else {
                      recognizedText =
                          "Voice command completed.";
                    }
                  });
                },
                icon: const Icon(Icons.mic),
                label: Text(
                  listening
                      ? "Stop Listening"
                      : "Start Listening",
                ),
              ),
            ),

          ],

        ),

      ),

    );

  }

}
