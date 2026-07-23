import 'package:flutter/material.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({super.key});

  @override
  State<LiveLocationScreen> createState() =>
      _LiveLocationScreenState();
}

class _LiveLocationScreenState
    extends State<LiveLocationScreen> {

  String latitude = "--";
  String longitude = "--";
  String address = "Location not available";

  bool loading = false;

  Future<void> getLocation() async {

    setState(() {
      loading = true;
    });

    // TODO:
    // Request Permission
    // Get Current Position
    // Reverse Geocode Address

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {

      latitude = "23.8103";

      longitude = "90.4125";

      address =
          "Dhaka, Bangladesh";

      loading = false;

    });

  }

  @override
  void initState() {

    super.initState();

    getLocation();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Live Location"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 120,
            ),

            const SizedBox(height: 30),

            Card(

              child: ListTile(

                leading: const Icon(Icons.place),

                title: const Text("Address"),

                subtitle: Text(address),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(Icons.gps_fixed),

                title: const Text("Latitude"),

                subtitle: Text(latitude),

              ),

            ),

            Card(

              child: ListTile(

                leading: const Icon(Icons.gps_not_fixed),

                title: const Text("Longitude"),

                subtitle: Text(longitude),

              ),

            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: FilledButton.icon(

                onPressed: loading
                    ? null
                    : getLocation,

                icon: const Icon(Icons.refresh),

                label: Text(

                  loading
                      ? "Getting Location..."
                      : "Refresh Location",

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
