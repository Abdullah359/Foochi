import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foochi/pages/signin_page.dart';
import '../components/animate_card.dart';
import '../components/custom_indicator.dart';
import 'package:get/get.dart';
import '../components/outline_button.dart';
import '../model/content_model.dart';

class FoochiOnboardingView extends StatefulWidget {
  const FoochiOnboardingView({super.key});

  @override
  State<FoochiOnboardingView> createState() => _FoochiOnboardingViewState();
}

class _FoochiOnboardingViewState extends State<FoochiOnboardingView> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingCard(
                    index: index,
                    onBoarding: onboardingList[index],
                  );
                },
              ),
            ),
            CustomIndicator(position: currentIndex),
            const SizedBox(height: 83),
            CustomOutlinedButton(
              width: 130,
              onTap: () {
                if (currentIndex == (onboardingList.length - 1)) {
                  Get.to(() => const FoochiSignInView());
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text: currentIndex == (onboardingList.length - 1)
                  ? 'Get Started'
                  : 'Next',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
