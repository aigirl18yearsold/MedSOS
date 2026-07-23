import 'package:flutter/material.dart';

class AddEditContactScreen extends StatefulWidget {
  final bool isEditing;

  const AddEditContactScreen({
    super.key,
    this.isEditing = false,
  });

  @override
  State<AddEditContactScreen> createState() =>
      _AddEditContactScreenState();
}

class _AddEditContactScreenState
    extends State<AddEditContactScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String relationship = "Family";

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void saveContact() {

    if (!_formKey.currentState!.validate()) return;

    // TODO:
    // Save to Firebase

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.isEditing
              ? "Edit Contact"
              : "Add Emergency Contact",
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const CircleAvatar(
                  radius: 45,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),

                const SizedBox(height: 30),

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

                DropdownButtonFormField<String>(

                  value: relationship,

                  decoration: const InputDecoration(
                    labelText: "Relationship",
                    prefixIcon: Icon(Icons.people),
                  ),

                  items: const [

                    DropdownMenuItem(
                      value: "Family",
                      child: Text("Family"),
                    ),

                    DropdownMenuItem(
                      value: "Parent",
                      child: Text("Parent"),
                    ),

                    DropdownMenuItem(
                      value: "Friend",
                      child: Text("Friend"),
                    ),

                    DropdownMenuItem(
                      value: "Doctor",
                      child: Text("Doctor"),
                    ),

                    DropdownMenuItem(
                      value: "Guardian",
                      child: Text("Guardian"),
                    ),

                    DropdownMenuItem(
                      value: "Other",
                      child: Text("Other"),
                    ),

                  ],

                  onChanged: (value) {
                    setState(() {
                      relationship = value!;
                    });
                  },

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

                const SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email (Optional)",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    onPressed: saveContact,
                    child: Text(
                      widget.isEditing
                          ? "Update Contact"
                          : "Save Contact",
                    ),
                  ),
                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}
