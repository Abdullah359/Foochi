import 'package:flutter/material.dart';
import 'package:foochi/pages/signup_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/fade_animation.dart';
import '../components/my_navbar.dart';
import '../components/my_text_auth_fields.dart';
import '../components/mytext_button.dart';
import '../components/primary_button.dart';
import '../components/social_icon_row.dart';
import '../model/content_model.dart';

class FoochiSignInView extends StatefulWidget {
  const FoochiSignInView({Key? key}) : super(key: key);

  @override
  State<FoochiSignInView> createState() => _FoochiSignInViewState();
}

class _FoochiSignInViewState extends State<FoochiSignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(children: [
              const SizedBox(height: 80),
              Center(child: Image.asset(AppAssets.kAppLogo)),
              const SizedBox(height: 30),
              Text('Sign In',
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondary)),
              const SizedBox(height: 24),
              SocialIconRow(
                facebookCallback: () {
                  debugPrint('Facebook');
                },
                googleCallback: () {
                  debugPrint('Google');
                },
                twitterCallback: () {
                  debugPrint('Twitter');
                },
              ),
              const SizedBox(height: 30),
              Text('Or with Email',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kSecondary)),
              const SizedBox(height: 23),
              AuthField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                isFieldValidated: isEmailCorrect,
                onChanged: (value) {
                  setState(() {});
                  isEmailCorrect = validateEmail(value);
                },
                hintText: 'Your Email',
                validator: (value) {
                  if (!validateEmail(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AuthField(
                isPasswordField: true,
                hintText: 'Your Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                isForgetButton: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password should be at least 8 characters';
                  } else if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password should contain at least one uppercase letter, one lowercase letter, one special character, and one digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Get.offAll(() => const MyNavbar());
                    }
                  },
                  text: 'Sign In'),
              const SizedBox(height: 60),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'New User?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kSecondary,
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    Get.to(() => const FoochiSignUpView());
                  },
                  text: 'Sign Up',
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(value);
    }
  }
}
