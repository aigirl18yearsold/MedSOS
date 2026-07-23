import 'package:flutter/material.dart';

class SearchMedicationScreen extends StatefulWidget {
  const SearchMedicationScreen({super.key});

  @override
  State<SearchMedicationScreen> createState() =>
      _SearchMedicationScreenState();
}

class _SearchMedicationScreenState
    extends State<SearchMedicationScreen> {

  final TextEditingController searchController =
      TextEditingController();

  final List<String> categories = [
    "All",
    "Tablet",
    "Capsule",
    "Injection",
    "Syrup",
    "Drops",
    "Inhaler"
  ];

  String selectedCategory = "All";

  final List<Map<String, String>> medications = [

    {
      "name": "Paracetamol",
      "type": "Tablet",
      "time": "8:00 AM",
    },

    {
      "name": "Vitamin D",
      "type": "Capsule",
      "time": "9:00 AM",
    },

    {
      "name": "Insulin",
      "type": "Injection",
      "time": "8:00 PM",
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Search Medication"),
      ),

      body: Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(16),

            child: TextField(

              controller: searchController,

              decoration: InputDecoration(

                hintText: "Search medication...",

                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),

              onChanged: (_) {
                setState(() {});
              },

            ),

          ),

          SizedBox(

            height: 50,

            child: ListView.builder(

              scrollDirection: Axis.horizontal,

              itemCount: categories.length,

              itemBuilder: (_, index) {

                final category = categories[index];

                return Padding(

                  padding:
                      const EdgeInsets.symmetric(horizontal: 6),

                  child: ChoiceChip(

                    label: Text(category),

                    selected:
                        selectedCategory == category,

                    onSelected: (_) {

                      setState(() {

                        selectedCategory = category;

                      });

                    },

                  ),

                );

              },

            ),

          ),

          const SizedBox(height: 15),

          Expanded(

            child: ListView.builder(

              itemCount: medications.length,

              itemBuilder: (_, index) {

                final med = medications[index];

                if (selectedCategory != "All" &&
                    med["type"] != selectedCategory) {
                  return const SizedBox();
                }

                if (!med["name"]!
                    .toLowerCase()
                    .contains(searchController.text
                        .toLowerCase())) {
                  return const SizedBox();
                }

                return Card(

                  margin:
                      const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8),

                  child: ListTile(

                    leading: const CircleAvatar(

                      child: Icon(Icons.medication),

                    ),

                    title: Text(med["name"]!),

                    subtitle: Text(
                      "${med["type"]} • ${med["time"]}",
                    ),

                    trailing: const Icon(
                        Icons.arrow_forward_ios),
                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}
