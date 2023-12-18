import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/fade_animation.dart';
import '../components/my_text_auth_fields.dart';
import '../components/mytext_button.dart';
import '../components/primary_button.dart';
import '../components/social_icon_row.dart';
import '../model/content_model.dart';

class FoochiSignUpView extends StatefulWidget {
  const FoochiSignUpView({super.key});

  @override
  State<FoochiSignUpView> createState() => _FoochiSignUpViewState();
}

class _FoochiSignUpViewState extends State<FoochiSignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isNameCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(children: [
              const SizedBox(height: 80),
              Center(child: Image.asset(AppAssets.kAppLogo)),
              const SizedBox(height: 30),
              Text('Sign Up',
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
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
              AuthField(
                controller: _usernameController,
                hintText: 'Your Username',
                isFieldValidated: isNameCorrect,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  isNameCorrect = validateName(value);
                  setState(() {});
                },
                validator: (value) {
                  if (!validateName(value!)) {
                    return 'Enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AuthField(
                controller: _emailController,
                hintText: 'Your Email',
                keyboardType: TextInputType.emailAddress,
                isFieldValidated: isEmailCorrect,
                onChanged: (value) {
                  setState(() {});
                  isEmailCorrect = validateEmail(value);
                },
                validator: (value) {
                  if (!validateEmail(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AuthField(
                hintText: 'Your Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                isPasswordField: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (value.length < 6) {
                    return 'Password should be at least 6 characters';
                  } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password should contain at least one uppercase letter, one lowercase letter, one special character and one digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Sign Up'),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already a member?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.kPrimary,
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Sign In',
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final nameRegex = RegExp(r'^[a-zA-Z]+$');
      return nameRegex.hasMatch(value);
    }
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
