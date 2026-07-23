import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashOnboardingScreen extends StatefulWidget {
  const SplashOnboardingScreen({super.key});

  @override
  State<SplashOnboardingScreen> createState() =>
      _SplashOnboardingScreenState();
}

class _SplashOnboardingScreenState
    extends State<SplashOnboardingScreen> {

  final PageController controller = PageController();

  bool showSplash = true;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  Future<void> startSplash() async {

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      showSplash = false;
    });

  }

  Future<void> finishOnboarding() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("onboardingCompleted", true);

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      "/login",
    );

  }

  @override
  Widget build(BuildContext context) {

    if (showSplash) {

      return Scaffold(

        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: const [

              Icon(
                Icons.local_hospital,
                size: 90,
                color: Colors.red,
              ),

              SizedBox(height: 20),

              Text(
                "MedSOS",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Your AI Healthcare Companion",
              ),

            ],

          ),

        ),

      );

    }

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: PageView(

                controller: controller,

                onPageChanged: (index) {

                  setState(() {
                    currentPage = index;
                  });

                },

                children: const [

                  OnboardingPage(

                    icon: Icons.medication,

                    title: "Manage Your Medications",

                    description:
                        "Track medicines, receive reminders and never miss a dose.",

                  ),

                  OnboardingPage(

                    icon: Icons.emergency,

                    title: "Emergency Assistance",

                    description:
                        "Send SOS alerts, share live location and reach nearby hospitals instantly.",

                  ),

                  OnboardingPage(

                    icon: Icons.smart_toy,

                    title: "AI Healthcare",

                    description:
                        "Scan prescriptions, identify pills and get AI-powered assistance.",

                  ),

                ],

              ),

            ),

            SmoothPageIndicator(

              controller: controller,

              count: 3,

              effect: const WormEffect(),

            ),

            const SizedBox(height: 30),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(

                children: [

                  TextButton(

                    onPressed: finishOnboarding,

                    child: const Text("Skip"),

                  ),

                  const Spacer(),

                  FilledButton(

                    onPressed: () {

                      if (currentPage == 2) {

                        finishOnboarding();

                      } else {

                        controller.nextPage(

                          duration:
                              const Duration(milliseconds: 300),

                          curve: Curves.easeInOut,

                        );

                      }

                    },

                    child: Text(

                      currentPage == 2
                          ? "Get Started"
                          : "Next",

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 25),

          ],

        ),

      ),

    );

  }

}
