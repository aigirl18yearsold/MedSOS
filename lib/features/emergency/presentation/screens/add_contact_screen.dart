import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() =>
      _AddContactScreenState();
}

class _AddContactScreenState
    extends State<AddContactScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Emergency Contact"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Form(

          key: _formKey,

          child: Column(

            children: [

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: FilledButton(

                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      // Save Contact

                    }

                  },

                  child: const Text(
                    "Save Contact",
                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
