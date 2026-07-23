import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() =>
      _LoginRegisterScreenState();
}

class _LoginRegisterScreenState
    extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            const SizedBox(height: 40),

            const Icon(
              Icons.local_hospital,
              size: 80,
            ),

            const SizedBox(height: 15),

            const Text(
              "MedSOS",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Login"),
                Tab(text: "Register"),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LoginTab(),
                  RegisterTab(),
                ],
              ),
            ),

          ],

        ),

      ),

    );

  }

}
