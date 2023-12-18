import 'dart:ui';

class AppAssets {
  static String kOnboardingFirst = 'assets/images/foochi/onboarding-first.png';
  static String kOnboardingSecond =
      'assets/images/foochi/onboarding-second.png';
  static String kOnboardingThird = 'assets/images/foochi/onboarding-third.png';
  static String kAppLogo = 'assets/logos/logo.png';
  static String kGoogle = 'assets/icons/icons-google.png';
  static String kFacebook = 'assets/icons/icons-facebook.png';
  static String kTwitter = 'assets/icons/icons-twitter.png';
}

class Onboarding {
  String title1;
  String title2;
  String description;
  String image;
  Onboarding({
    required this.title1,
    required this.title2,
    required this.description,
    required this.image,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
      title1: 'Diverse ',
      title2: 'and fresh food',
      description:
      'With an extensive menu prepared by talented chefs, fresh quality food.',
      image: AppAssets.kOnboardingFirst),
  Onboarding(
      title1: 'Easy to ',
      title2: 'change dish ingredients',
      description:
      'You are a foodie, you can add or subtract ingredients in the dish.',
      image: AppAssets.kOnboardingSecond),
  Onboarding(
      title1: 'Delivery ',
      title2: 'Is given on time',
      description:
      'With an extensive menu prepared by talented chefs, fresh quality food.',
      image: AppAssets.kOnboardingThird)
];

class AppColors {
  static const Color kPrimary = Color(0xFF84BD93);
  static const Color kSecondary = Color(0xFF3F2D20);
  static const Color kBackground = Color(0xFFFFF5E0);
  static const Color kOrange = Color(0xFFEF8829);
  static const Color kLine = Color(0xFFE6DCCD);
}
