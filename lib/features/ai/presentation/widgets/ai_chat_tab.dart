import 'package:flutter/material.dart';

class AIChatTab extends StatefulWidget {
  const AIChatTab({super.key});

  @override
  State<AIChatTab> createState() => _AIChatTabState();
}

class _AIChatTabState extends State<AIChatTab> {

  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, dynamic>> messages = [

    {
      "isUser": false,
      "message":
          "Hello! I'm your MedSOS AI Assistant. How can I help you today?"
    }

  ];

  void sendMessage() {

    if (messageController.text.trim().isEmpty) return;

    setState(() {

      messages.add({
        "isUser": true,
        "message": messageController.text.trim(),
      });

      // Backend AI response will come here

      messages.add({
        "isUser": false,
        "message": "Thinking..."
      });

    });

    messageController.clear();

  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Expanded(

          child: ListView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: messages.length,

            itemBuilder: (_, index) {

              final message = messages[index];

              return Align(

                alignment: message["isUser"]
                    ? Alignment.centerRight
                    : Alignment.centerLeft,

                child: Container(

                  margin:
                      const EdgeInsets.symmetric(vertical: 6),

                  padding:
                      const EdgeInsets.all(14),

                  constraints:
                      const BoxConstraints(maxWidth: 300),

                  decoration: BoxDecoration(

                    color: message["isUser"]
                        ? Colors.blue
                        : Colors.grey.shade300,

                    borderRadius:
                        BorderRadius.circular(18),

                  ),

                  child: Text(

                    message["message"],

                    style: TextStyle(
                      color: message["isUser"]
                          ? Colors.white
                          : Colors.black,
                    ),

                  ),

                ),

              );

            },

          ),

        ),

        Container(

          padding: const EdgeInsets.all(10),

          child: Row(

            children: [

              Expanded(

                child: TextField(

                  controller: messageController,

                  decoration: const InputDecoration(

                    hintText:
                        "Ask anything about your health...",

                    border: OutlineInputBorder(),

                  ),

                ),

              ),

              const SizedBox(width: 10),

              IconButton(

                icon: const Icon(Icons.send),

                onPressed: sendMessage,

              ),

            ],

          ),

        ),

      ],

    );

  }

}
