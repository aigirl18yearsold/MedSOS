import 'package:flutter/material.dart';

class OnboardingPage {
  final IconData icon;
  final String title;
  final String description;

  OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final controller = PageController();

  int currentPage = 0;

  final pages = [

    OnboardingPage(
      icon: Icons.medication,
      title: "Stay on Track",
      description:
          "Never miss a dose with intelligent medication reminders.",
    ),

    OnboardingPage(
      icon: Icons.emergency,
      title: "Emergency SOS",
      description:
          "Quickly alert family members during emergencies.",
    ),

    OnboardingPage(
      icon: Icons.record_voice_over,
      title: "Voice Assistant",
      description:
          "Control MedSOS completely hands-free.",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: PageView.builder(

                controller: controller,

                onPageChanged: (value){

                  setState(() {

                    currentPage=value;

                  });

                },

                itemCount: pages.length,

                itemBuilder: (_,index){

                  final page=pages[index];

                  return Padding(

                    padding:
                        const EdgeInsets.all(30),

                    child: Column(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        CircleAvatar(

                          radius: 70,

                          child: Icon(
                            page.icon,
                            size:70,
                          ),

                        ),

                        const SizedBox(height:40),

                        Text(

                          page.title,

                          textAlign:TextAlign.center,

                          style:const TextStyle(

                            fontSize:30,

                            fontWeight:FontWeight.bold,

                          ),

                        ),

                        const SizedBox(height:20),

                        Text(

                          page.description,

                          textAlign:TextAlign.center,

                          style:const TextStyle(

                            fontSize:18,

                          ),

                        ),

                      ],

                    ),

                  );

                },

              ),

            ),

            Padding(

              padding:
                  const EdgeInsets.all(20),

              child: ElevatedButton(

                onPressed: (){

                  if(currentPage==2){

                    Navigator.pushReplacementNamed(
                      context,
                      "/login",
                    );

                  }else{

                    controller.nextPage(

                      duration:const Duration(
                          milliseconds:300),

                      curve:Curves.ease,

                    );

                  }

                },

                child: Text(

                  currentPage==2
                      ?"Get Started"
                      :"Next",

                ),

              ),

            )

          ],

        ),

      ),

    );

  }

}
