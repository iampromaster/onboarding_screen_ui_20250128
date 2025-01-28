import 'package:flutter/material.dart';
import 'package:onboarding_screen_ui_20250128/container_image.dart';
import 'package:onboarding_screen_ui_20250128/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnboarding extends StatefulWidget {
  const MyOnboarding({super.key});

  @override
  State<MyOnboarding> createState() => _MyOnboardingState();
}

class _MyOnboardingState extends State<MyOnboarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 3;
            });
          },
          children: [
            buildImageContainer(
              Colors.white,
              'Explore New Trial',
              'Embark on a journey with us',
              'assets/images/trek1.jpg',
            ),
            buildImageContainer(
              Colors.white,
              'Prepare for Adventure',
              'Get ready for an unforgettable experience',
              'assets/images/trek2.jpg',
            ),
            buildImageContainer(
              Colors.white,
              'Caputure Memories',
              'Capture your special moments',
              'assets/images/trek3.jpg',
            ),
            buildImageContainer(
              Colors.white,
              'Experience Adventure',
              'Feel the joy of adventure',
              'assets/images/trek4.jpg',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.deepPurple[300],
                  minimumSize: const Size.fromHeight(70),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(3);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      effect: WormEffect(
                          spacing: 15,
                          dotColor: Colors.purple.shade400,
                          activeDotColor: Colors.purple.shade300),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeInOut,
                      ),
                      controller: controller,
                      count: 4,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
